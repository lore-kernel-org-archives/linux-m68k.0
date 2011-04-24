From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Fix for SLUB? (was: Fwd: [PATCH v3] mm: make expand_downwards
 symmetrical to expand_upwards)
Date: Sun, 24 Apr 2011 14:19:28 +1200
Message-ID: <4DB388B0.9030201@gmail.com>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>	<BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>	<BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>	<BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com> <m2tydohp23.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:43920 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757373Ab1DXCT1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 22:19:27 -0400
Received: by pvg12 with SMTP id 12so777033pvg.19
        for <linux-m68k@vger.kernel.org>; Sat, 23 Apr 2011 19:19:27 -0700 (PDT)
In-Reply-To: <m2tydohp23.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>

Andreas Schwab wrote:
> Michael Schmitz <schmitzmic@googlemail.com> writes:
>
>   
>> Hi,
>>
>> node_present_pages(node) returns false:
>>
>> m68k_setup_node: node 0 addr 0 size 14680064
>> m68k_setup_node: node 0 not present!
>> m68k_setup_node: node 1 addr 16777216 size 268435456
>> m68k_setup_node: node 1 not present!
>>     
>
> That's because paging_init calls m68k_setup_node before
> free_area_init_node, which is where node_present_pages is set.
>
>   
Thanks - I had tried to move the code to just before the 
free_area_init_node loop and given up there.

Much appreciated,

  Michael
