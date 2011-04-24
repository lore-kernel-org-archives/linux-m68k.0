From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
Date: Sun, 24 Apr 2011 16:01:30 +1200
Message-ID: <4DB3A09A.70308@gmail.com>
References: <1303317178.2587.30.camel@mulgrave.site> <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com> <20110421220351.9180.A69D9226@jp.fujitsu.com> <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211500170.5741@router.home> <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com> <alpine.DEB.2.00.1104211501470.20201@chino.kir.corp.google.com> <4DB3840F.3060503@gmail.com> <BANLkTi=vm-qs48-JySCpv+YHyC+9sO9U0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=vm-qs48-JySCpv+YHyC+9sO9U0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: KOSAKI Motohiro <kosaki.motohiro@gmail.com>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, David Rientjes <rientjes@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, schwab@linux-m68k.org, "tg@mirbsd.de >> Thorsten Glaser" <tg@mirbsd.de>
List-Id: linux-m68k@vger.kernel.org

KOSAKI Motohiro wrote:
> 2011/4/24 Michael Schmitz <schmitzmic@googlemail.com>:
>   
>> David Rientjes wrote:
>>     
>>> For m68k, N_NORMAL_MEMORY represents all nodes that have present memory
>>> since it does not support HIGHMEM.  This patch sets the bit at the time the
>>> node is brought online.
>>>
>>> If N_NORMAL_MEMORY is not accurate, slub may encounter errors since it
>>> uses this nodemask to setup per-cache kmem_cache_node data structures.
>>>
>>> Signed-off-by: David Rientjes <rientjes@google.com>
>>> ---
>>>  arch/m68k/mm/init_mm.c |    2 ++
>>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
>>> --- a/arch/m68k/mm/init_mm.c
>>> +++ b/arch/m68k/mm/init_mm.c
>>> @@ -59,6 +59,8 @@ void __init m68k_setup_node(int node)
>>>        }
>>>  #endif
>>>        pg_data_map[node].bdata = bootmem_node_data + node;
>>> +       if (node_present_pages(node))
>>> +               node_set_state(node, N_NORMAL_MEMORY);
>>>        node_set_online(node);
>>>  }
>>>
>>>       
>> As Andreas pointed out, node_present_pages is set in free_area_init_node
>> which only gets called at the very end of m68k mm paging_init.
>>
>> The correct patch would be something like this - the need for the
>> conditional is perhaps debatable, seeing as we set the pages present just
>> before node_set_state.
>>
>> Tested on my ARAnyM test setup so far. I'd like to wait for an independent
>> kernel image built by Thorsten before I test on the actual hardware. Sorry
>> but you'll have to restart your build Thorsten :-)
>>
>> Signed-off-by: Michael Schmitz <schmitz@debian.org>
>> --
>> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
>> index 02b7a03..b806c19 100644
>> --- a/arch/m68k/mm/motorola.c
>> +++ b/arch/m68k/mm/motorola.c
>> @@ -300,6 +300,8 @@ void __init paging_init(void)
>>               zones_size[ZONE_DMA] = m68k_memory[i].size >> PAGE_SHIFT;
>>               free_area_init_node(i, zones_size,
>>                                   m68k_memory[i].addr >> PAGE_SHIFT, NULL);
>> +                if (node_present_pages(i))
>> +                        node_set_state(i, N_NORMAL_MEMORY);
>>       }
>> }
>>     
>
> I think you are right. however I doubt m68k need to care memoryless node check.
> probably following patch just work.
>
> ------------------------------------
>  diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
>  --- a/arch/m68k/mm/init_mm.c
>  +++ b/arch/m68k/mm/init_mm.c
>  @@ -59,6 +59,8 @@ void __init m68k_setup_node(int node)
>         }
>   #endif
>         pg_data_map[node].bdata = bootmem_node_data + node;
>         node_set_online(node);
> +      node_set_state(node, N_NORMAL_MEMORY);
>   
It does in fact - that's what I had as a workaround before.

Memory node information is provided by the respective m68k bootstrap so 
memoryless nodes won't be possible indeed.
> Maybe, the correct solution is to use CONFIG_ARCH_POPULATES_NODE_MAP feature.
> the usage is simple, adding add_active_range() and replacing
> free_area_init_node() with free_area_init_nodes().
>   
Either of the patches should work as long as there is not a potential 
problem with setting the node state before setting node_present_pages. 
Your suggestion may work as well but I cannot judge whether there may be 
side effects in relation to special case handling of node zero on m68k. 
Do we need to call add_active_range at the time init_bootmem_node is 
called? That would be a bit earlier in paging_init, and achieve much the 
same thing as the proposed patch or the earlier workaround.

Besides, your solution would set N_HIGH_MEMORY not N_NORMAL_MEMORY if I 
read free_area_init_nodes() right. Does that matter?

Cheers,

  Michael
