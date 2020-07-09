# frozen_string_literal: true

Airport.destroy_all

Airport.create([
                 { code: 'SFO',
                   name: 'San Fransisco' },
                 { code: 'NYC',
                   name: 'New York' }
               ])
