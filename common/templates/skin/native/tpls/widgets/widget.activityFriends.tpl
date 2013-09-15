{**
 * Выбор друзей для чтения в ленте активности
 *
 * @styles css/widgets.css
 *}

{extends file='./_aside.base.tpl'}

{block name='block_title'}{$aLang.stream_block_users_friends}{/block}
{block name='block_type'}activity{/block}

{block name='block_content'}
	{if $oUserCurrent}
		<small class="note">{$aLang.stream_settings_note_follow_friend}</small>

		{if $aStreamFriends}
			<ul class="user-list-mini max-height-200 js-activity-block-users">
				{foreach $aStreamFriends as $oUser}
					{$iUserId = $oUser->getId()}

					<li id="activity-block-users-item-{$iUserId}">
						<input class="input-checkbox"
							   type="checkbox"
							   {if $aStreamSubscribedUsers.$iUserId}checked{/if}
							   data-user-id="{$iUserId}" />
						<a href="{$oUser->getProfileUrl()}">{$oUser->getLogin()}</a>
					</li>
				{/foreach}
			</ul>
		{else}
			<small class="note">{$aLang.stream_no_subscribed_users}</small>
		{/if}
	{/if}
{/block}