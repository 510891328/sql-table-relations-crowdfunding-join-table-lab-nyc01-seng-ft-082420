# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT p.title, SUM(pm.amount) FROM projects AS p INNER JOIN pledges AS pm ON p.id = pm.project_id GROUP BY p.id ORDER BY p.title ASC"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT u.name, u.age, SUM(pm.amount) FROM users AS u INNER JOIN pledges AS pm ON u.id = pm.user_id GROUP BY u.id ORDER BY u.name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT p.title, (SUM(pm.amount) - p.funding_goal) FROM projects AS p INNER JOIN pledges AS pm ON p.id = pm.project_id GROUP BY p.id HAVING SUM(pm.amount) >= funding_goal ORDER BY p.title ASC"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT u.name, SUM(pm.amount) FROM users AS u INNER JOIN pledges AS pm ON u.id = pm.user_id GROUP BY u.name ORDER BY SUM(pm.amount)"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT p.category, pm.amount FROM projects AS p INNER JOIN pledges AS pm ON p.id = pm.project_id WHERE p.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT p.category, SUM(pm.amount) FROM projects AS p INNER JOIN pledges AS pm ON p.id = pm.project_id GROUP BY p.category HAVING p.category = 'books'"
end
