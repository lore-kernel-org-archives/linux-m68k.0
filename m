From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: Fwd: [PATCH 35/91] arch/m68k/q40/README Update broken web addresses
 in the arch directory.
Date: Fri, 03 Sep 2010 02:58:30 -0700
Message-ID: <4C80C6C6.10506@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-5-git-send-email-justinmattock@gmail.com> <AANLkTimyRsVmeeM-mNwAm8uwhAEYZx4Wx56=ARy=tttO@mail.gmail.com> <alpine.OSX.2.00.1009031821450.344@localhost> <4C80B350.6050006@gmail.com> <alpine.OSX.2.00.1009031837380.344@localhost> <4C80BA15.1000203@gmail.com> <alpine.OSX.2.00.1009031906200.344@localhost> <4C80C151.2050201@gmail.com> <alpine.OSX.2.00.1009031938070.344@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52191 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752244Ab0ICJ6F (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 05:58:05 -0400
Received: by pzk9 with SMTP id 9so535464pzk.19
        for <linux-m68k@vger.kernel.org>; Fri, 03 Sep 2010 02:58:04 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1009031938070.344@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 09/03/2010 02:40 AM, Finn Thain wrote:
>
>
> On Fri, 3 Sep 2010, Justin P. Mattock wrote:
>
>>
>> so the safest is to just ignore the column limit for urls to make things
>> legit.
>
> That's how I've dealt with URLs in C comments in the past, and no-one
> complained (and I don't see any decent alternative anyway).
>
> Finn
>

well, over here, I'm learning new things daily(so I thank you for your 
patience), as for the url... makes sense...as for the mechanisms that 
crap out with such changes... then maybe something as simple as /*...*/ 
for the compiler...(but who knows...main thing is making sure these urls 
are working...), just checked most of the kernel, seems sane todo...just 
a matter of patience and such...

Justin P. Mattock
