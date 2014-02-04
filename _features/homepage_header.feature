Feature: Test homepage header

	Background:
		Given I visit "home" page

	Scenario Outline: Header's logo link should be loaded
		When I set window width to <width>px
		Then I should have clickable header's logo link
		And I should see that header's logo link has text "Yi Zeng"

		Examples:
			| width |
			| 240   |
			| 320   |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Header's navigation links shouldn't be displayed when width is less than 420px
		When I set window width to <width>px
		Then I should have header's navigation links presented
		And I should <see?> header's navigation links

		Examples:
			| width | see?    |
			| 240   | not see |
			| 320   | not see |
			| 640   | see     |
			| 768   | see     |
			| 1280  | see     |
			| 1920  | see     |

	Scenario Outline: Header's navigation links should be clickable when width is greater than 420px
		When I set window width to <width>px
		Then I should have clickable header's navigation links

		Examples:
			| width |
			| 640   |
			| 768   |
			| 1280  |
			| 1920  |

	Scenario Outline: Header's navigation links should be working as intended
		When I click navigation link text "<link_text>"
		Then I should see page url "<page_url>" (with slashes)
		And I should see page title "<page_title>"
		And I should see title header "<title_header>"

		Examples:
			| link_text  | page_url     | page_title           | title_header |
			| Yi Zeng    | /            | Yi Zeng              | All Posts    |
			| Articles   | /articles/   | Articles - Yi Zeng   | Articles     |
			| Notes      | /notes/      | Notes - Yi Zeng      | Notes        |
			| Categories | /categories/ | Categories - Yi Zeng | Categories   |
			| Tags       | /tags/       | Tags - Yi Zeng       | Tags         |
			| About      | /about/      | About - Yi Zeng      | About        |

	Scenario Outline: Header's search link should be shown when width is greater then 520px
		When I set window width to <width>px
		Then I should <see?> header's search link

		Examples:
			| width | see?    |
			| 240   | not see |
			| 320   | not see |
			| 480   | not see |
			| 640   | see     |
			| 768   | see     |
			| 1280  | see     |
			| 1920  | see     |

	Scenario Outline: Header's search button icon should be shown when width is smaller then 520px
		When I set window width to <width>px
		Then I should <see?> header's search button icon

		Examples:
			| width | see?    |
			| 240   | see     |
			| 320   | see     |
			| 480   | see     |
			| 640   | not see |
			| 768   | not see |
			| 1280  | not see |
			| 1920  | not see |

	Scenario Outline: Header's search button or link should clickable depending on width
		When I set window width to <width>px
		Then I should have clickable header's search <element?>

		Examples:
			| width | element? |
			| 240   | button   |
			| 320   | button   |
			| 480   | button   |
			| 640   | link     |
			| 768   | link     |
			| 1280  | link     |
			| 1920  | link     |

	Scenario Outline: Header's search overlay should be loaded after opening
		When I set window width to <width>px
		And I refresh the page
		And I click header's search <element?>
		Then I should have search overlay opened

		Examples:
			| width | element?    |
			| 240   | button     |
			| 320   | button     |
			| 480   | button     |
			| 640   | link |
			| 768   | link |
			| 1280  | link |
			| 1920  | link |