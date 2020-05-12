defmodule Conference.ArticleRepoTest do
  use Conference.ArticleRepoCase
  alias Conference.Repository.ArticleRepo, as: ARepo
  alias Conference.Model.Article, as: Article
  alias Conference.Model.UserDetails, as: UserDetails
  alias Conference.Repository.UserDetailsRepo, as: URepo


  test "insert user" do
    {:ok, _new_user} = %UserDetails{}
    |> UserDetails.changeset(%{"first_name" => "bob", "last_name" => "test", "affiliation"=> "aff"})
    |> URepo.insert()

    assert 1 == length(URepo.all(UserDetails))
    ARepo.delete_all(Article)
    URepo.delete_all(UserDetails)
  end
end
