require 'sinatra'
class Todo 
    attr_accessor :task, :done, :urgent, :important
    def initialize task, urgent, important, done
        @task=task
        @done=done
        @urgent=urgent
        @important=important
    end
end
Tasks=[]
get '/' do
    data=Hash.new
    data[:tasks]=Tasks
    erb :main, locals: data
end
post '/add' do
       task=params["task"]
       if task.length != 0
       if params.has_key?("urgent")==true
           urgent=true
       else
           urgent=false
       end
       if params.has_key?("important")==true
           important=true
       else
          important=false
       end
       todo=Todo.new task,urgent,important,false
       Tasks << todo
       end
       return redirect '/'
end