Instagram Challenge
===================

```
___        .---------.._
______!fsc!_....-' .g8888888p. '-------....._
.'          //     .g8:       :8p..---....___ \'.
| Ben's    //  ()  d88:       :88b|==========! !|
|         //       888:       :888|==========| !|
|___      \\_______'T88888888888P''----------'//|   
|   \       """"""""""""""""""""""""""""""""""/ |   
|    !...._____      .="""=.   .[]    ____...!  |   
|   /               ! .g$p. !   .[]          :  |   
|  !               :  $$$$$  :  .[]          :  |   
|  !                ! 'T$P' !   .[]           '.|   
|   \__              "=._.="   .()        __    |   
|.--'  '----._______________________.----'  '--.|
'._____________________________________________.'
```

We were given a couple of days to build Instagram using Rails. This was going to require at least three models; users, posts and comments.

I started with the users model by installing and setting up the Devise gem. This then lead to quite a while getting the tests to pass.

Next was posts, generated with scaffold for a full RESTful mode and more editing of the generated tests. Linking the two models was relatively straightforward with extra work in controllers. Using Active Storage for post images was surprisingly straightforward (even to test).

Comments. Done too, though only just - and with poor test coverage.

I couldn't leave it with the basic html stylings so setup my friend Semantic UI.

[The stories that I drafted can be found here](https://github.com/benfurber/instagram-challenge/tree/master/docs/stories.md)
