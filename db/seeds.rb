# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create!(name: "WorkEvalution")
puts "Company #{company.name} was created"

team = Team.new(name: "Team A")
team.company = company
team.save!
puts "Team #{team.name} was created"

user1 = User.create!(
  first_name: "Vivian",
  last_name: 'Bow',
  email: 'vivian@lewagon.jp',
  password: '123456',
  team: team
)
puts "User #{user1.first_name} was created"

user2 = User.create!(
  first_name: "John",
  last_name: 'Lemon',
  email: 'John@lewagon.jp',
  password: '123456',
  team: team
)
puts "User #{user2.first_name} was created"


categories_list = {
  'Problem Solving': {
    'Analysis': ['Analysis', 'Divergent Thinking', 'Experimenting', 'Observation'],
    'Creativity': ['Artistic Sense', 'Imagination', 'Brainstorming', 'Design', 'Design Sense', 'Innovation', 'Insight',
                   'Inspiration', 'Mind Mapping', 'Lateral Thinking'],
    'Troubleshooting': ['Troubleshooting', 'Questioning', 'Logical Reasoning', 'Persistence', 'Reframing']
  },
  'Leadership': {
    'Team Management': ['People Management','Remote Team Management', 'Talent Management', 'Virtual Team Management',
                        'Team-Building', 'Coaching', 'Supervising', 'Delegation', 'Mentoring', 'Facilitating',
                        'Cultural Intelligence', 'Conflict or Dispute Resolution'],
    'Project Management': ['Project Management', 'Meeting Management', 'Agility', 'Deal-Making', 'Decision-Making',
                           'Strategic Planning'],
    'Interpersonal': ['Encouraging', 'Generosity', 'Humility', 'Inspiring', 'Selflessness', 'Authenticity', 'Versatility',
                      'Give Clear Feedback', 'Managing Difficult Conversations']
  },
  'Work Ethic': {
    'Adaptability': ['Initiative', 'Motivated', 'Open-Minded', 'Optimistic', 'Taking Criticism',
                     'Tolerance of Change and Uncertainty', 'Trainable'],
    'Diligence': ['Attentive', 'Competitiveness', 'Curiosity', 'Highly Organized', 'Perseverant', 'Results-Oriented'],
    'Discipline': ['Calm', 'Commitment', 'Emotion Management', 'Independence', 'Professional', 'Punctual', 'Resilient'],
    'Responsibility': ['Dependability', 'Integrity', 'Reliable']
  },
  'Teamwork': {
    'Conflict Resolution': ['Coordination', 'Deal with Difficult Situations', 'Mediation', 'Office Politics Management',
                            'Personality Conflicts Management'],
    'Collaborative': ['Accept Feedback', 'Collaborative', 'Cooperation', 'Idea Exchange', 'Influential', 'Sales Skills',
                      'Social Skills'],
    'Cultural Awareness': ['Disability Awareness', 'Diversity Awareness', 'Intercultural Competence'],
    'Empathetic': ['Emotional Intelligence', 'Interpersonal Relationships Skills', 'Respectfulness', 'Self-Awareness']
  },
  'Communication': {
    'General Communication': ['Verbal Communication', 'Non-verbal Communication', 'Visual Communication',
                              'Written Communication', 'Active Listening', 'Clarity', 'Confidence', 'Interviewing'],
    'Negotiation': ['Negotiation', 'Personal Branding', 'Persuasion', 'Presentation Skills', 'Public Speaking',
                    'Story Telling'],
    'Diplomacy': ['Diplomacy', 'Empathy', 'Friendliness', 'Humor', 'Networking', 'Patience', 'Positive Reinforcement',
                  'Sensitivity', 'Tolerance']
  },
  'Time Management': {
    'Planning': ['Allocating Resources', 'Goal-Setting', 'Organization', 'Personal Time Management', 'Planning',
                 'Scheduling', 'Task Planning', 'Time Awareness'],
    'Prioritizing': ['Prioritization', 'Sense of Urgency', 'Streamlining'],
    'Performing': ['Acuity','Coping', 'Focus', 'Introspection', 'Memory', 'Recall', 'Stress Management', 'Task Tracking',
                   'Work-Life Balance']
  }
}
categories_list.each do |category|
  Category.create(name: category)
  Subcategory.create(name)
end
