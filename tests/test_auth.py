from tests import util


class TestAuth:
    def test_one(self):
        token = util.get_token("2020122104559", "827ccb0eea8a706c4c34a16891f84e7b")
        assert token is not None

