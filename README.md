#Harry Potter and the Magic of Ruby

The code in this repository wants to teach you a little bit about the magic of the Ruby programming language, in particular, Ruby objects, using inspiration from Harry Potter.

It was created for RailsGirls.London, December 2018

### SHOPPING FOR SUPPLIES AT DIAGON ALLEY
#### (SET UP YOUR SYSTEM)
1. Have a code-friendly text editor, like atom.io or sublimetext, on your computer.
2. Install ruby https://www.ruby-lang.org/en/downloads/
3. Pull the code from this github repository: https://github.com/saramoohead/harry-potter-and-the-magic-of-ruby
4. Start IRB in your terminal. If you've never done that before, start here: https://www.ruby-lang.org/en/documentation/quickstart/
5. In IRB, load this program's files by typing or pasting in:
  load 'harry_potter_and_the_magic_of_ruby.rb'
This loads a ruby file that lists all the other ruby files that need for the code to work in IRB.


### YOUR FIRST TRANSFIGURATION LESSON
(Imagine that I am channeling Professor McGonagall. And be grateful that you don't have to hear my awful impersonation.)

Today, children, you are going to transform some bits of code into a wizard who can cast spells.

1. To begin this lesson, we need Harry Potter.

How do you make Harry Potter as code? In Ruby, he would be an object. A Ruby object is a bundle of code that has attributes and behaviours; an object can be and do things as a single unit. An Object, with a capital O.

Ruby expects you to code your own classes that will create objects to your specification.

You could create all the things in the Harry Potter universe - the people, the places, the wands. And you'd be able to make them do the things they do in the story. Basically, you'd be J K Rowling.

But we're just going to start with Harry.

#### (SET UP THE OBJECT CREATOR)
Naming is hard but, to get started, I'm going to name the class that creates Harry Potter, the Character class.

I will define the Character class with an attribute called `name` and a behaviour called `speak`.

Look at the file `model/character.rb` to see the code.

#### (SET UP THE OBJECT)
But this code isn't Harry Potter. This is the code that will create Harry Potter. We have to instruct the Character class to create him. This is how you do that:

In your IRB terminal type:
`harry = Character.new(name: "Harry Potter")`

You should see output like:
`=> #<Character:0x007fcb9283d050 @name="Harry Potter", @inventory=[]>`

We know Harry can speak, because he was created by a class that has the defined behaviour `speak`. Let's make him speak.

Type:
`harry.speak("Hello")`

You should see the output:

    Hello.
     => nil

Fantastic! We have Harry Potter and he can speak.

There are other characters in the story. So, using the same Character class, let's make another, but with different parameters:

`aunt_petunia = Character.new(name: "Petunia Dursely")`

That's enough characters to get us started.

### Where's the magic?
We have Harry but, right now, he can only speak. We've only defined that one behaviour for Character. Where's his magic?

Let's add it in.

In your IRB terminal, type `exit`.
Go to the file models/character.rb and, just above the `end` on line 12, add:

    def cast(spell)
      puts spell.upcase + "!"
    end

Now, repeat step 5 from Diagon Alley above to get irb running again and the new version of the code loaded. Also, create Harry Potter again:
`harry = Character.new(name: "Harry Potter")`

Now type: `harry.cast("Expecto patronum")`

You'll see the magically capitalised magic spell output:

    > EXPECTO PATRONUM!

This is truly magic! But wait!! We have a problem!


### Repello Muggletum (Wizards Unite, anyone?)
Create Aunt Petunia again:
`aunt_petunia = Character.new(name: "Petunia Dursely")`

Now type `aunt_petunia.cast("Expecto patronum")`

No, no, no! What would J K Rowling say? We've done it all wrong. Aunt Petunia shouldn't be able to cast a spell.

How can we make our two character objects behave the same in some ways but differently in others? How can code object Harry do magic, while code object Petunia cannot?

With the code we have now, that is not possible. Because both objects are created from the class Character, either both objects get magic, or neither.

### Platform 9 3/4
We can't keep the magic code in the Character class. We have to extract the magic method and keep it firmly in the magic world, behind a big brick wall that Muggles can't get through.

Exit the IRB terminal again and delete the code you added to models/character.rb.

Go have a peek in concerns/magic.rb. You'll see the cast method there:

    def cast(spell)
      puts spell.upcase + "!"
    end

Notice that this doesn't say `class Magic` at the top. It says `module Magic`. A module is Ruby's way of being able to make some behaviours that can be shared with objects. A module doesn't create a new object, like a Class does. It is for holding behaviours.

### The Sorting Hat

But separating out the magic is only the first step. We have to sort our characters into different types of characters.

One is a Wizard, and one is most definitely a Muggle (complicated backstory not withstanding). But both objects should have a name and be able to speak, which are coded into the class Character.

We need to keep both Harry and Petunia as characters, but ensure only the Wizard can do magic.

Look at the file `models/wizard.rb`.

You'll see:

    class Wizard < Character
     include Magic
    end

And `models/muggle.rb` gives us:

	  class Muggle < Character

	  end

The less-than sign before Character means that the class Wizard is a type of Character, and inherits all the traits and behaviour of Character.

But only the Wizard class gets Magic included.

Now, we start up IRB again, load the files and create our objects again, using these new classes:

`harry = Wizard.new(name: "Harry Potter")`
`aunt_petunia = Muggle.new(name: "Petunia Dursely")`

And while Harry can cast his spell:
`harry.cast("Expecto patronum")`

    > EXPECTO PATRONUM!

Aunt Petnuia cannot:
`aunt_petunia.cast("Expecto patronum")`

    NoMethodError: undefined method `cast' for #<Muggle:0x007ffc72009738 @name="Petunia Dursely">
	from (irb):6
	from /Users/saraoc/.rvm/rubies/ruby-2.4.1/bin/irb:11:in `<main>'

The error message says that Aunt Petunia doesn't know how to cast -- undefined method.

### Master gave Dobby a sock
Of course, there is more than one type of magic user. Harry uses a wand to make his magic, but Dobby doesn't need a wand to do his magic.

Ruby magic let's us create a HouseElf class that also inherits from Character and include the Magic module. Now, we are sharing the behaviours of Magic across different object classes.


In conclusion, there is no magic spell for learning how to code quickly. But with each little piece of code that you make do what you tell it to, you'll build up your powers to make something as rich and beautiful, and hopefully as successful as the Harry Potter world.

Good luck!
