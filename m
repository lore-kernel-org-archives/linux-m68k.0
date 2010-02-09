From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: m68k/for-2.6.34
Date: Tue, 09 Feb 2010 14:27:12 +0300
Message-ID: <4B714690.5090200@codesourcery.com>
References: <10f740e81002011212t91a087bkeb77dac23f5676e0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([38.113.113.100]:58831 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335Ab0BIL1Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Feb 2010 06:27:16 -0500
In-Reply-To: <10f740e81002011212t91a087bkeb77dac23f5676e0@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

On 2/1/10 11:12 PM, Geert Uytterhoeven wrote:
...
> If there's anything else in m68k-queue (or anyplace else :-) you
> desperately want in 2.6.34, please let me know.

Looking through the bug fixes I submitted while testing NPTL support, I 
noticed that I forgot the patches that address problems in signal 
handling for ColdFire.  Namely,

* Define sigcontext ABI for ColdFire
* Fix m68k-uclinux's rt_sigreturn trampoline

I just sent the updated patches against m68k/for-2.6.34 here 
<http://marc.info/?l=linux-m68k&m=126571455916199&w=2>.  Can we include 
these into 2.6.34?

Regards,

-- 
Maxim Kuvyrkov
CodeSourcery
maxim@codesourcery.com
(650) 331-3385 x724
