From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel v2.6.38
Date: Mon, 25 Apr 2011 14:48:41 +1200
Message-ID: <4DB4E109.3090809@gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com> <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org> <alpine.OSX.2.00.1104250119030.307@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:46725 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758041Ab1DYCsu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 22:48:50 -0400
Received: by pzk9 with SMTP id 9so1020617pzk.19
        for <linux-m68k@vger.kernel.org>; Sun, 24 Apr 2011 19:48:49 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1104250119030.307@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Finn Thain wrote:
> On Sat, 23 Apr 2011, Thorsten Glaser wrote:
>
>   
>> No idea about the required status of the other patches, e.g. Mac. Finn?
>>     
>
> Most of the relevant mac patches were merged into the mainline prior to 
> the 2.6.34 release and by 2.6.37 all of them were merged.
>
> I do have some unfinished patches based on 2.6.37 but I'm pretty sure they 
> don't relate to the mac hardware used by the Debian/68k developers.
>   
Incidentially - did you work on the Mac 5380 SCSI code recently? Does it 
work with full error handling capability in its current state?

I begin to feel the only way to make the Falcon SCSI code work again is 
a clean restart ...

Cheers,

  Michael
