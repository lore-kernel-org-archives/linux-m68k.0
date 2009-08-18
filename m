From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 12:56:02 +0400
Message-ID: <4A8A6CA2.4040806@codesourcery.com>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>	<4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:56960 "EHLO
	mail.codesourcery.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758048AbZHRI4J (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Aug 2009 04:56:09 -0400
In-Reply-To: <m3d46tpmue.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Andreas Schwab wrote:
> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
> 
>> The need would be (a) use numbers that are very unlikely to used for
>> normal syscalls,
> 
> I don't understand.  These are normal syscalls.
> 
>> and (b) using -1..-4 for the syscall numbers works out quite nicely
>> for the code in entry.S.  It adds just a couple of instructions to the
>> execution path.
> 
> Those additional instructions are totally unnecessary.

Hm, I though it would be preferable to keep syscalls that are specific 
to m68k (in the sense that no other target requires them) separate from 
the ones implementing standard unix/linux functionality.

If the consensus is that the new syscalls should received 331..334 
numbers, that would only simplify the implementation.

--
Maxim
