contests =  [
    {
      title: 'Math Challenge',
      description: 'Test your math skills with a series of challenges',
      url: 'https://mathchallenge.com',

    },
    {
      title: 'Science Trivia',
      description: 'A trivia game based on various scientific facts',
      url: 'https://sciencetrivia.com',

    },
    {
      title: 'Language Exchange',
      description: 'Connect with people who want to another language',
      url: 'https://languageexchange.com',

    },
    {
      title: 'Coding Competition',
      description: 'Compete with other coders to solve coding problems',
      url: 'https://codingcompetition.com',

    },
    {
      title: 'Art Challenge',
      description:
        'Participate in an art challenge and showcase your creativity',
      url: 'https://artchallenge.com',

    },
    {
      title: 'Geography Quiz',
      description: 'Test your knowledge of geography with a fun quiz',
      url: 'https://geographyquiz.com',

    },
    {
      title: 'Business Plan Competition',
      url: 'https://businessplancompetition.com',

    },
    {
      title: 'Virtual Marathon',
      description: 'Run a marathon from the comfort of your home',
      url: 'https://virtualmarathon.com',

    },
    {
      title: 'Cooking Challenge',
      description:
        'Participate in a cooking challenge and show off your culinary skills',
      url: 'https://cookingchallenge.com',

    },
    {
      title: 'Music Trivia',
      description: 'A trivia game based on various musical facts',
      url: 'https://musictrivia.com',

    },
    {
      title: 'Fitness Challenge',
      description: 'Join a fitness challenge and track your progress',
      url: 'https://fitnesschallenge.com',

    },
    {
      title: 'Movie Quiz',
      description: 'Test your knowledge of movies with a fun quiz',
      url: 'https://moviequiz.com',

    },
  ]


contests.each_with_index do |contest, idx|
  contest[:date] = Date.today + idx
  contest[:url] = 'https://docs.google.com/forms/d/e/1FAIpQLSfqM13ancodW1mHmB5D_iIQS-3dGWQYKhlKnefvEbzsAxRlTw/viewform'
  Contest.create(contest)
end
