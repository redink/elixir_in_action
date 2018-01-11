# write elixir application

Application is a very common form of Elixir code organization. It often include several different modules but these modules are all for same purpose. Or provide one library, or is one OTP application includes supervisor process and worker process to provide one service.

In this chapter, I will introduce some action about how to write an elixir application, and how to organize several different applications into a project.

First, let take a first look to elixir application, take a look what does it look like.

* [application first look](2_1_application_first_look.md)

Then. I will create one new elixir application step by step, and introduce some key point.

* [create one elixir application](2_2_create_one_elixir_application.md)

The following, I intend to sort out some stuff about `Supervisor` and `GenServer` in general.

* [supervisor and gen server in general](2_3_supervisor_and_gen_server_in_general.md)

Since there is one specific supervisor strategy in OTP application, it is very important to arrange one single small chapter for it.

* [simple one for one supervisor](2_4_simple_one_for_one_supervisor.md)


...
