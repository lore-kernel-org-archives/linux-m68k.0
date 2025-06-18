Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E42E9738
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249314; cv=none; b=V2LvQYpIeDFRm+fkq7avYY9ctdj5dk2BSw2xBV/oMu3m7aX6l3LV8Jtd2RVI2q800IxgZszcvv44zLeDN7y8LEH3sixBuNYbuA4si8pvYEbp5KVKpMLWAuVZhVkv0TKEzDrwqS6hAYUjkPixAjNOpNXkJL9S0V5rlkK12q0Fh+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249314; c=relaxed/simple;
	bh=U6/1UdYdiJfm2jOgKNbqDporGHKuTY32khEHrZ8ltyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atZVo9StjvuMGiANuJKrg4rWyIy/SZH9s8vDnPHP5/lgU+g1IUUy0Ru18w1SU02TNLiQblVZpr/SZd2tyj7PpXaUuW4leDauxhIpY11oWUd8jug7WSyFgBKs5xWMQmudGBRDVvaBf7mdX8By+YparDKanoNwe7yNLeAlP9GKbcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXV14v5P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXV14v5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF032C4CEE7;
	Wed, 18 Jun 2025 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750249313;
	bh=U6/1UdYdiJfm2jOgKNbqDporGHKuTY32khEHrZ8ltyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BXV14v5PYG9wuiyWGDcpny2MARZhxRuZ0pFWkr3dJaKr/3VFBWRmKEr1vvcT/gqJf
	 onBcEeQQrH3jjUs+iqhoDs/eFCTwdHH3OVatgmzSC1cBtAT7glqU/HPRXzyTzQLna3
	 OoF3NmGhr1VZxZe2CvSHPpvN8cpi1YfVoD95WbWUD/3leNcLYz1Ig1OA4h3334yslu
	 05PzmxOTOulISvcE4IXEHkISiSKAH2JN91oOSzmNK2srHvaTHeyjj0tZFnL8E+p753
	 0yQFszOJKH4qvSO9gct/KHGYuhRoBISxTPXwlypMF8MF/VdqBPKxdGZ59HJYxwySAv
	 vys3RhwkFANpw==
Message-ID: <38c670cc-6169-4720-a883-c34df26e1a4f@kernel.org>
Date: Wed, 18 Jun 2025 22:21:49 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
 <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Adrian,

On 18/6/25 20:04, John Paul Adrian Glaubitz wrote:
> Hello Geert,
> 
> On Wed, 2025-06-18 at 11:56 +0200, Geert Uytterhoeven wrote:
>>> Coldfire already uses a different alignment (for the stack):
>>>
>>> /* ColdFire and fido strongly prefer a 32-bit aligned stack.  */
>>> #define PREFERRED_STACK_BOUNDARY \
>>>    ((TARGET_COLDFIRE || TARGET_FIDOA) ? 32 : 16)
>>>
>>> It's instruction set is also not fully compatible AFAIK.
>>
>> Sure, but you will impact it regardless.
> 
> Could you please elaborate this a bit more, please?
> 
> Coldfire is handled as a separate target via TARGET_COLDFIRE in GCC, so we
> would certainly be able to toggle the alignment settings independent of
> what's done on classic m68k.

The net out is that it is the same gcc compiler, m68k-linux-gcc.
ColdFire just needs specific code generation via command line switches,
like -m5200 (or -m5206e or -m5307 or -mcfv4e, etc). This is the same way
you would specify 680x0 level - m68020, -m68030, etc.

The bulk of the instruction set is the same. Asm code will look totally
familiar to anyone who knows m68k :-)   One notable difference is that
there is a more limited set addressing modes for some instructions.

FWIW ColdFire currently uses the same ABI as all other m68k, so it uses
2-byte alignment today.


> In the Linux kernel, Coldfire is also a separate
> arch, so the alignment settings can also be handled there separately if necessary.

ColdFire is not handled as a separate architecture in linux, it is just a
variant of m68k - so uses arch/m68k in the source.


> It's not really necessary to enforce this on Coldfire. However, since buildroot
> builds completely from source, it wouldn't even be a problem to change the alignment
> there as well.

Yes, that is totally right in my experience. Certainly in my ColdFire work
it is pretty much always a build-everything approach via buildroot or similar.
I wouldn't think an ABI change would actually worry too many ColdFire uses,
they don't use distributions like debian on them. (I would love to hear from
anyone who does!).

Regards
Greg



> PS: I would like to lead a discussion on how to implement this properly and
> not continue to have one why this shouldn't be done as the latter is continuing
> to take a lot of energy.
> 
> Adrian
> 

