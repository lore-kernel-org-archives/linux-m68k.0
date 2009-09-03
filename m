From: mike <localgost@gmail.com>
Subject: Re: bogl: don't know screen type 1
Date: Thu, 3 Sep 2009 18:41:27 +0200
Message-ID: <8259f0250909030941y74b60241na319c8e4cb4f8e31@mail.gmail.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
	 <20090831120617.GA1114@marenka.net>
	 <8259f0250908310558l3ddd5fam7d15946a7c1e8572@mail.gmail.com>
	 <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
	 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>
	 <20090901151747.GB27514@marenka.net>
	 <8259f0250909021816g2b6a37dfs9bd91c4cabaf457a@mail.gmail.com>
	 <8259f0250909021822k70b1a152sce6ecc651334800@mail.gmail.com>
	 <4A9F9183.2040403@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:62620 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754687AbZICQlZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Sep 2009 12:41:25 -0400
Received: by bwz19 with SMTP id 19so72687bwz.37
        for <linux-m68k@vger.kernel.org>; Thu, 03 Sep 2009 09:41:27 -0700 (PDT)
In-Reply-To: <4A9F9183.2040403@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

 Maxim K.
Its this one, i havent tried building myslef since 2.6.28. but i dont
think that was this slow
http://people.debian.org/~smarenka/d-i/m68k/images/20090813-01:13/kernels/
http://aminet.net/search?query=2.6.28

Im still having trouble installing, the installer just cant seem to
read the fs, even formatted a partition to ffs, which should work, and
i have no /lib/modules/asfs etc. Could it be a problem with the way
3.9 has handled the harddrive?

-Mike
2009/9/3 Maxim Kuvyrkov <maxim@codesourcery.com>:
> mike wrote:
>>
>> I tried to boot 2.6.29 or whatever... It was so slow compared to 2.4 i
>> donno what to say, except its crap. Not a surprise if gcc produces
>> crappier and crappier 68k binaries anyway.
>
> Would you mind submitting a bug report or two with preprocessed testcases
> showing examples of bad code generation on m68k, especially if the code has
> regressed since some previous version of GCC?
>
> Please CC me on the bug reports.
>
> Thanks,
>
> --
> Maxim K.
> CodeSourcery
>
