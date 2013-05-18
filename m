From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: m68k-queue
Date: Sat, 18 May 2013 20:38:26 +1200
Message-ID: <51973E02.6090302@biophys.uni-duesseldorf.de>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com> <5191FC4C.8010707@biophys.uni-duesseldorf.de> <20130515054540.GA8137@cynthia.pants.nu> <CAMuHMdX_Mhd1gnZic1sr0nyJJs=oPt54hx7jRfv7j=Dth46VPQ@mail.gmail.com> <20130518070910.GA26647@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:33307 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751586Ab3ERIih (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 May 2013 04:38:37 -0400
Received: by mail-da0-f46.google.com with SMTP id e20so531485dak.33
        for <linux-m68k@vger.kernel.org>; Sat, 18 May 2013 01:38:36 -0700 (PDT)
In-Reply-To: <20130518070910.GA26647@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Brad,

>> https://git.kernel.org/cgit/linux/kernel/git/geert/linux-m68k.git/log/?h=m68k-queue
>> and click on the commit you're interested in.
>>     
>
> Thank you. I took a look, and I agree with everyone else that this was a
> legacy patch that isn't required.
>
> The original idea was to use the same API for both real ADB requests and
> everything else that goes through the PMU, Egret, or CUDA chips. This
> includes not only RTC/PRAM management, but power control and several
> other things as well. It wasn't such a great idea, honestly.
>   
I'm sure it was one of these 'how can we get some piece of code reused 
to do something almost entirely unrelated' ideas. Sounds like what I'd 
have done just to solve the hwclock handling and get on with hacking 
other stuff without being irritated by constant fscks ...

Code quality has improved a huge lot since. Keep in mind that mac68k was 
developed separate from m68k in the beginning. I have never had Alan's 
instinct for writing good clean code, 'it works' was usually good enough.

Cheers,

    Michael
