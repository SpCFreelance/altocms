{$oUserOwner=$oBlog->getOwner()}
<td rowspan="3" class="rating-value hidden-xs last-td" id="blog_user_count_{$oBlog->getId()}">
    {if Router::GetActionEvent()=='personal'}
        {$oUserOwner->getRating()|number_format:{Config::Get('view.rating_length')}}
    {else}
        {$oBlog->getRating()}
    {/if}
</td>