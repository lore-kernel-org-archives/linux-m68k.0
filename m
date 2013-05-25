From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Sat, 25 May 2013 21:01:08 +1200
Message-ID: <51A07DD4.3020601@gmail.com>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com> <C99A4D13-CF11-49A8-9CEE-A3FB8563509F@2013.bluespice.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36489 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753154Ab3EYJBU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 May 2013 05:01:20 -0400
Received: by mail-pd0-f170.google.com with SMTP id x10so4850261pdj.29
        for <linux-m68k@vger.kernel.org>; Sat, 25 May 2013 02:01:19 -0700 (PDT)
In-Reply-To: <C99A4D13-CF11-49A8-9CEE-A3FB8563509F@2013.bluespice.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?ISO-8859-1?Q?Ingo_J=FCrgensmann?= <ij@2013.bluespice.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Ingo,
>> I really hope to push this into mainline this time, and start to update the
>> defconfigs again every kernel release.
>> Any comments are welcome! Thanks!
>>     
>
>
> I'm just waiting for the support for Blizzard SCSI Support (ESP), but this should be the only thing I'm missing for now. 
>   

Do remind me :-) I've copied the rather rudimentary Zorro ESP driver I 
started on vivaldi off to my home machine, and merged  it into my 3.9  
devel tree. It'll need a bit of backporting into 3.2.25 once it's ready 
to test, but I can work on it more easily that way.

> Maybe cbmuser and twice11 can help Michael in porting the driver when Elgar finally got relocated to the FU Berlin?
>
>   
That would be appreciated.

Cheers,

    Michael
