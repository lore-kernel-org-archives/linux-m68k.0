From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH] m68k: Make sure {read,write}s[bwl]() are always defined
Date: Wed, 18 Apr 2012 19:59:20 +1200
Message-ID: <4F8E7458.8030301@gmail.com>
References: <1334516410-5777-1-git-send-email-geert@linux-m68k.org> <4F8C08F1.5050907@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41536 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751252Ab2DRH7h (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Apr 2012 03:59:37 -0400
Received: by pbcun15 with SMTP id un15so8634348pbc.19
        for <linux-m68k@vger.kernel.org>; Wed, 18 Apr 2012 00:59:37 -0700 (PDT)
In-Reply-To: <4F8C08F1.5050907@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Greg,
>>        Or do you want musb_io.h to check for
>>        "!(defined(CONFIG_M68K)&&  defined(CONFIG_MMU))" instead?
>
> No, I would rather see just the defined(CONFIG_M68K), and no check for
> CONFIG_MMU. I am pretty sure there is some similarity between the way
> the Atari does ISA bus interfacing to what some of the ColdFire boards
> do.
I sure hope you are wrong :-) But I think I saw some non-MMU Atari use 
attempts mentioned on the list, and the ROM port ISA adapter could well 
be used on non-MMU Ataris (though I'm not sure what address the ROM port 
would be mapped at on those - I'm sure Andreas will know the details 
there).

  Michael
