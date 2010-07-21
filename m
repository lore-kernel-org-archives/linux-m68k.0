From: =?ISO-8859-1?Q?Mattias_Engdeg=E5rd?= <mattiase@bredband.net>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Wed, 21 Jul 2010 22:53:43 +0200
Message-ID: <41EF646C-8866-4070-B772-94E39EF4620B@bredband.net>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net> <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtprelay-h22.telenor.se ([195.54.99.197]:45571 "EHLO
	smtprelay-h22.telenor.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758103Ab0GUV1a (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 21 Jul 2010 17:27:30 -0400
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id D7BB6E9A4A
	for <linux-m68k@vger.kernel.org>; Wed, 21 Jul 2010 22:53:44 +0200 (CEST)
In-Reply-To: <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, zippel@linux-m68k.org

21 jul 2010 kl. 22.32 skrev Geert Uytterhoeven:

> As the 'LC040 doesn't implement FPU instructions, I'd expect it to
> just generate an
> exception when the "fadd.d (a0)+,fp0" is encountered. I.e. not do  
> anything else,
> like postincrementing a0.

According to the manual, it generates a special 8-word exception frame  
that contains the decoded effective address, as a help to the  
emulator. It only makes sense if the user can just use that EA right  
away (after having established that it is a memory operand). I suppose  
the only way to find out is to find someone with a genuine 'LC040 (a  
non-buggy one).
