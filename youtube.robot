*** Settings ***
Library    Selenium2Library

*** Variables ***
${HOMEPAGE}		https://www.youtube.com
${BROWSER}		chrome
${SEARCH_BAR}	id=masthead-search-term
${SEARCH_BAR_BUTTON}	css=.search-button

*** Keywords ***
Open Homepage
	Open Browser	${HOMEPAGE}	${BROWSER}

*** Test Cases ***
Homepage Loads
	Open Homepage
	Element Should Be Visible	${SEARCH_BAR}
	[Teardown]	Close Browser

Search for Robot Framework Tutorial
	Open Homepage
	Input Text	${SEARCH_BAR}	Robot Framework Tutorial
	Click Button	${SEARCH_BAR_BUTTON}
	Wait Until Page Contains	results
	[Teardown]	Close Browser

Find Robot Framework Tutorial Channel
	Open Homepage
	Input Text	${SEARCH_BAR}	Robot Framework Tutorial
	Click Button	${SEARCH_BAR_BUTTON}
	BuiltIn.Sleep	5 seconds
	Click Element	xpath=//li/span[text()='Channel']
	${url}=	Get Location
	Should Be Equal As Strings	${url}	https://www.youtube.com/channel/UCgcU5MOQ7Q-huwBdGYIcYfQ
	[Teardown]	Close Browser
