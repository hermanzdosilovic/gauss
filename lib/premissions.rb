module Gauss
  class Premissions
    attr_reader :errors

    def initialize(attributes = {})
      @attributes = attributes.clone

      # Default organization_id is 'gauss'. This will always lead to 404 in Productive API.
      @attributes[:organization] ||= ENV['ORGANIZATION'] || 'gauss'
      @attributes[:project] ||= ENV['PROJECT'] unless ENV['PROJECT'].nil?
      @attributes[:task] ||= ENV['TASK'] unless ENV['TASK'].nil?

      # this will allow skipping task and project premission check if user did not specify
      # any options for task or project
      @cannot_access_task = false if @attributes[:task].nil?
      @cannot_access_project = false if @attributes[:project].nil?

      @projects = []
      @tasks = Hash.new {|h, k| h[k] = []}
    end

    def invalid?
      @errors = ''
      if cannot_access_organization?
        @errors = 'You are not part of this organization.'
      elsif cannot_access_project?
        @errors = 'Project you are looking for does not exist in this organization.'
      elsif cannot_access_task?
        @errors = 'Task you are looking for does not exist in this project.'
      end
      !@errors.empty?
    end

    def cannot_access_organization?
      fetch_organization_projects if @cannot_access_organization.nil? # do not fetch twice method
      @cannot_access_organization
    end

    def cannot_access_project?
      if @cannot_access_project.nil?
        fetch_organization_projects if @projects.empty?
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
