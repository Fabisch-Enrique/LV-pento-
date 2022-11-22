defmodule Pento.SurveyTest do
  use Pento.DataCase

  alias Pento.Survey

  describe "demographics" do
    alias Pento.Survey.Demographics

    import Pento.SurveyFixtures

    @invalid_attrs %{gender: nil, year_of_birth: nil}

    test "list_demographics/0 returns all demographics" do
      demographics = demographics_fixture()
      assert Survey.list_demographics() == [demographics]
    end

    test "get_demographics!/1 returns the demographics with given id" do
      demographics = demographics_fixture()
      assert Survey.get_demographics!(demographics.id) == demographics
    end

    test "create_demographics/1 with valid data creates a demographics" do
      valid_attrs = %{gender: "some gender", year_of_birth: 42}

      assert {:ok, %Demographics{} = demographics} = Survey.create_demographics(valid_attrs)
      assert demographics.gender == "some gender"
      assert demographics.year_of_birth == 42
    end

    test "create_demographics/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Survey.create_demographics(@invalid_attrs)
    end

    test "update_demographics/2 with valid data updates the demographics" do
      demographics = demographics_fixture()
      update_attrs = %{gender: "some updated gender", year_of_birth: 43}

      assert {:ok, %Demographics{} = demographics} = Survey.update_demographics(demographics, update_attrs)
      assert demographics.gender == "some updated gender"
      assert demographics.year_of_birth == 43
    end

    test "update_demographics/2 with invalid data returns error changeset" do
      demographics = demographics_fixture()
      assert {:error, %Ecto.Changeset{}} = Survey.update_demographics(demographics, @invalid_attrs)
      assert demographics == Survey.get_demographics!(demographics.id)
    end

    test "delete_demographics/1 deletes the demographics" do
      demographics = demographics_fixture()
      assert {:ok, %Demographics{}} = Survey.delete_demographics(demographics)
      assert_raise Ecto.NoResultsError, fn -> Survey.get_demographics!(demographics.id) end
    end

    test "change_demographics/1 returns a demographics changeset" do
      demographics = demographics_fixture()
      assert %Ecto.Changeset{} = Survey.change_demographics(demographics)
    end
  end

  describe "ratings" do
    alias Pento.Survey.Rating

    import Pento.SurveyFixtures

    @invalid_attrs %{stars: nil}

    test "list_ratings/0 returns all ratings" do
      rating = rating_fixture()
      assert Survey.list_ratings() == [rating]
    end

    test "get_rating!/1 returns the rating with given id" do
      rating = rating_fixture()
      assert Survey.get_rating!(rating.id) == rating
    end

    test "create_rating/1 with valid data creates a rating" do
      valid_attrs = %{stars: 42}

      assert {:ok, %Rating{} = rating} = Survey.create_rating(valid_attrs)
      assert rating.stars == 42
    end

    test "create_rating/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Survey.create_rating(@invalid_attrs)
    end

    test "update_rating/2 with valid data updates the rating" do
      rating = rating_fixture()
      update_attrs = %{stars: 43}

      assert {:ok, %Rating{} = rating} = Survey.update_rating(rating, update_attrs)
      assert rating.stars == 43
    end

    test "update_rating/2 with invalid data returns error changeset" do
      rating = rating_fixture()
      assert {:error, %Ecto.Changeset{}} = Survey.update_rating(rating, @invalid_attrs)
      assert rating == Survey.get_rating!(rating.id)
    end

    test "delete_rating/1 deletes the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{}} = Survey.delete_rating(rating)
      assert_raise Ecto.NoResultsError, fn -> Survey.get_rating!(rating.id) end
    end

    test "change_rating/1 returns a rating changeset" do
      rating = rating_fixture()
      assert %Ecto.Changeset{} = Survey.change_rating(rating)
    end
  end
end
