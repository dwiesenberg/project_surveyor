# project_surveyor

Surveyor assignment. Can one create several child records from data input in a single nested form?


Slack messages:

My question:
------------

Surveyor assignment. Can one create several child records from data input in a single nested form? 

Options are input together for each question. If a combined question-options form were created containing fields "question_test, option_1, option_2, ..., option_5" (say) with fixed maximum of options, all the data could be saved on the same record. That would be easy. And I don't think that's unreasonable.
    
But if I choose a "question" and a "choice" table, with each question having many choice records (no max), then I have a problem. All options are input on one form; from which I will want to create multiple "choice" records. How do I do that? For a start, how do I state in the whitelisted parameters method to expect an unknown mumber of option fields? Some kind of hash?
  
The course material assumes only *one* nested child record is created at a time. Is what I am asking too far above what is expected at this stage in the course? (Still, I'm all for trying if within a reasonable time.)


Chris Scavello' answer
----------------------

Chris Scavello
[1 hour ago] 
@david_wiesenberg I believe you’d specify `options` as an array in the strong params with a many-to-many relationship (edited)


David Wiesenberg [1 hour ago] 
Like this?
```  
def whitelisted_question_params
    params.require(:question).permit(:question_text,
      choices_attributes: [[:option, :id, :_destroy]])
  end
```


David Wiesenberg [1 hour ago] 
One moment … one question has_many choices. So where does many-to-many fit in?


Chris Scavello [1 hour ago] 
Searching for an answer here, I think I meant `choices` instead of `options`


Chris Scavello
[1 hour ago] 
I’m not finding an exact answer in my Googling


Chris Scavello
[1 hour ago] 
You can create an array of objects with HTML forms by setting the `name` attribute to something like `question[choices][]`


Chris Scavello
[1 hour ago] 
Then for each attribute on that choice you’d put the name of the attribute after the `[]`


Chris Scavello
[1 hour ago] 
Like this `question[choices][][text]` for example


Chris Scavello
[1 hour ago] 
I believe you might have to iterate over these manually (with `each`) server-side in your controller. I’d be curious to hear from other students on how they accomplished this @here


David Wiesenberg [1 hour ago] 
I found these search results:
`http://vicfriedman.github.io/blog/2015/07/18/create-multiple-objects-from-single-form-in-rails/` and `http://railscasts.com/episodes/196-nested-model-form-part-1` .

They will be helpful … it may take quite a bit of time to work out.

