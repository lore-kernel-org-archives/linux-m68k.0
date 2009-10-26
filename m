From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Mon, 26 Oct 2009 18:01:11 +0300
Message-ID: <4AE5B9B7.7000106@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>	 <4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>	 <4A8A6CA2.4040806@codesourcery.com> <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com> <4A91A4C8.5040803@codesourcery.com> <4A943ECC.80607@codesourcery.com> <4A97B69F.4000306@codesourcery.com> <4AC5CF12.8000200@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:51079 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752423AbZJZPBO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Oct 2009 11:01:14 -0400
In-Reply-To: <4AC5CF12.8000200@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

Maxim Kuvyrkov wrote:
...
> Geert, in case there'll be further changes in the NPTL patch, would you 
> like me submit full patch against original tree or only the incremental 
> difference?

Ping.

Geert, did you have a chance to look over the patch from Oct. 2 2009?

I've done a lot of testing since then and TLS/NPTL support on 
m68k/ColdFire is now stable enough to have no unexpected failures on 
binutils, gcc, g++, libstdc++ and glibc testsuites.

Thanks,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
