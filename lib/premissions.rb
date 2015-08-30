require 'pry'

module Gauss
  class Premissions
    def initialize(attributes = {})
      @attributes = attributes

      @cannot_access_task = false if @attributes[:task].nil?
      @cannot_access_project = false if @attributes[:project].nil?

      @attributes[:organization] ||= ENV['ORGANIZATION'] || 'gauss'
      @attributes[:project] ||= ENV['PROJECT'] if ENV['PROJECT']

      @projects = []
      @tasks = Hash.new {|h, k| h[k] = []}
    end

    def cannot_access_organization?
      fetch_organization_projects if @cannot_access_organization.nil?
      @cannot_access_organization
    end

    def cannot_access_project?
      if @cannot_access_project.nil? || @projects.empty?
        fetch_organization_projects
        @cannot_access_project = !(@projects.include? @attributes[:project])
      end
      @cannot_access_project
    end

    def cannot_access_task?
      fetch_organization_tasks if @cannot_access_task.nil?
      @cannot_access_task
    end

    private

    def fetch_organization_projects
      projects_url = "/#{@attributes[:organization]}/projects"
      response = HTTParty.get(BASE_URL + projects_url, {query: {token: ENV['PRODUCTIVE_API_KEY']}})

      return @cannot_access_organization = true if response.code != 200

      @projects = response['response'].map { |e| e['id'].to_s }
      @cannot_access_organization = false
    end

    def fetch_organization_tasks
      tasks_url = "/#{@attributes[:organization]}/projects/#{@attributes[:project]}/tasks"
      response = HTTParty.get(BASE_URL + tasks_url, {query: {token: ENV['PRODUCTIVE_API_KEY']}})

      return @cannot_access_task = true if response.code != 200

      response['response'].each do |task|
        @tasks[task['project_id'].to_s] << task['id'].to_s
      end
      @cannot_access_task = !(@tasks[@attributes[:project]].include? @attributes[:task])
    end
  end
end
