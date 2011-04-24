From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Fix for SLUB?
Date: Sun, 24 Apr 2011 14:06:16 +1200
Message-ID: <4DB38598.5000607@gmail.com>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com> <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com> <BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com> <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com> <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com> <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org> <20110423185725.GA16947@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:42375 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757466Ab1DXCGP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 22:06:15 -0400
Received: by pvg12 with SMTP id 12so775063pvg.19
        for <linux-m68k@vger.kernel.org>; Sat, 23 Apr 2011 19:06:14 -0700 (PDT)
In-Reply-To: <20110423185725.GA16947@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Christian T. Steigies wrote:
>> I???m trying now (using a cross compiler, to speed up testing).
>> Sorry for not doing anything for a while, the ???air has left
>> me??? (generally and due to lack of progress with m68k as one
>> can only be the only fighter for ever so long).
>>     
>
> I can understand this, but I am very impressed by all the work you have done
> for m68k recently! Please don't give up.
>   
I'll second this sentiment wholeheartedly. It's been good to see a fresh 
face injecting a lot of life into the project.
>  
>   
>> But I was just told by a member of the Debian Kernel Team on
>> IRC that the patches from m68k-v2.6.38 will (probably) not be
>> accepted, unless they go in via Linus??? tree. How are chances
>> of that happening? (He says they had told that years ago al-
>> ready.) I???ll need at least the ARAnyM/NatFeat support and some
>> of the bugfixes. Otherwise I fear this keeps getting obsolete
>> very fast. ???
>>     
>
> As Geert wrote, almost all patches will make it into the official kernel
> tree, only m68k usually needs them a little sooner. Is there no m68k DD left
> who works on the kernel? When I was still submitting patches, there never
> was a problem, but I made sure that m68k patches only got applied to the
> m68k tree. Of course, the smaller the patches, the better, and Geert was
> very good with sending m68k patches upstream. In case you can not get those
> small patches in, I can give it a try (when I have a properly working DSL
> again, and more time, so I can also set up crest and kullervo...).
>   
At the very least, the Debian kernel maintainers ought to take a small 
patch to disable SLUB for m68k for as long as it takes to get this fix 
included via upstream and possibly backporting.

Cheers,

  Michael
