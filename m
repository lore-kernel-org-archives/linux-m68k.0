From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Wed, 17 Apr 2013 19:44:52 +1200
Message-ID: <516E52F4.1020008@gmail.com>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>	<CAMuHMdVv_EAsRUV9FRLmnR5DzaBmW9dPABiMMpuc43G0anMKxw@mail.gmail.com> <CAMuHMdV=KmLpwFF24sPr7PXdHJd2_K=LFRjdMORYp4TWwHR7Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:40938 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965776Ab3DQHpK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 17 Apr 2013 03:45:10 -0400
Received: by mail-pd0-f181.google.com with SMTP id y10so743957pdj.12
        for <linux-m68k@vger.kernel.org>; Wed, 17 Apr 2013 00:45:10 -0700 (PDT)
In-Reply-To: <CAMuHMdV=KmLpwFF24sPr7PXdHJd2_K=LFRjdMORYp4TWwHR7Cg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,
>>   - Made platform device structures and isp1160_delay() in
>>     arch/m68k/atari/config.c depend on the appropriate CONFIG_* symbols, else
>>     you get unused warnings from the compiler if CONFIG_ETHERNAT and/or
>>     CONFIG_ETHERNEC are not set.
>>     
>
> I moved the introduction of CONFIG_ETHERNAT and CONFIG_ETHERNEC into
> the commits that added the corresponding platform devices, so they became
> independent of the commits that update files under drivers/net/.
>   
Thanks - I'll have a look at what that involves. Sounds reasonable.
> I also queued all arch/m68k commits to for-3.10/for-next.
>
>   
Hint, hint ... I still haven't submitted net and USB stuff for comments :-(

We have ANZAC day coming up next week - should give me enough time 
unless sorted before.

Cheers,

    Michael
