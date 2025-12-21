Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0122BE05A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Dec 2025 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766361670; cv=none; b=frsewV8Xwv+N7CH8khGau2CPxMJO+mtOi2+fz4WVvORHz2xxN2ak76qoH171pSlOoZLiCDKb9TOnHS2Bos3bYSvUVo9x4YCrFfcV43QZqODH/qrYFw/n2i6JROF/7ZjrCbXZcTjuM6wjrEdICqubIjpYuifXEGTP2MrvSaUjKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766361670; c=relaxed/simple;
	bh=TCPHoBS8yTW3aMPKynxGVSVshmFxQeIcZHaqo4n/nEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llDmYMsKN8N1kXYsWuE1sATvaKSOLxJecsE7eX17pBroMkq4mDQuG2FYIoV2WnOo0meJudhROfAfAAdyW4Enivj81XSED6Zf2jFwkRxJWFkufZLmVUnGP/g+AAz8XfxuVEXib/n2TLWV21j2tDQJy5yCqIHPk8A4WVtu2v7aDsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=KwSKvlUF; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="KwSKvlUF"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id B116A2113003;
	Mon, 22 Dec 2025 01:54:09 +0200 (EET)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id ZSSGzCbv9AO7; Mon, 22 Dec 2025 01:54:05 +0200 (EET)
Received: from [192.168.101.100] (87-92-37-248.bb.dnainternet.fi [87.92.37.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id E5FC12113E0B;
	Mon, 22 Dec 2025 01:54:04 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi E5FC12113E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1766361245;
	bh=jhqnSybF2IB4CeQLYaeeq2Mc3xw0YVGtyId8h+IoDMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KwSKvlUFMVSGtwOwUn92O2yYfSjnpUGG+WlIk62y0lv5uHAIIz5jtNXVGvuiobuOb
	 H3Mas6oXMIeEl0LLSACoIPvURrWu7RbbhRNeITqTbrvtKe4XmZcl467n/7ugVl/ZrF
	 B6zYkbqmHwR8JYn9RNhhkTzoMX9A/WOUfItwtKXB9gJu/IslG9zLaO/XU6JmgoBzV3
	 WXg43KjCMFbPMbrva6+stMhg1r1M99GAfCmTx2FVuYnn6ghy0+54icEd0a8IHrJstq
	 Oodh4WVI/AFWY/mN/J7zdxyWTVBSqQDbRMPTMhHpBagDo9nS9M+oashpKzjaoitrVT
	 247OGIpvgo4rg==
Message-ID: <5a1242e4-c8a6-4f31-828c-07bc64df5f3f@helsinkinet.fi>
Date: Mon, 22 Dec 2025 01:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
To: Daniel Palmer <daniel@thingy.jp>
Cc: linux-m68k@lists.linux-m68k.org
References: <20251213120401.3992567-1-daniel@thingy.jp>
 <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
 <CAFr9PX=hfUoqyiVwA5CRoC6mmr4KmYbxvodMmFFk_k8-NGp9cg@mail.gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <CAFr9PX=hfUoqyiVwA5CRoC6mmr4KmYbxvodMmFFk_k8-NGp9cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 12/19/25 15:30, Daniel Palmer wrote:
> On Fri, 19 Dec 2025 at 20:59, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> On 13/12/25 22:04, Daniel Palmer wrote:
>>> 68000 has different alignment needs to 68020+.
>>> memcpy() checks if the destination is aligned and does a smaller copy
>>> to fix the alignment and then critically for 68000 it checks if the
>>> source is still unaligned and if it is reverts to smaller copies.
>>>
>>> memmove() does not currently do the second part and malfunctions if
>>> one of the pointers is aligned and the other isn't.
>>
>> What is the nature of the failure, is it a trap?
> 
> Address error because of the unaligned address. This was actually a
> real pain to work out because on QEMU it worked fine (mainline QEMU
> allows the unaligned access[0]) and on the real CPU it just locked up.
Both WinUAE (Amiga) and Hatari (Atari) emulators emulate 680x0 
exceptions just fine, and can run Linux.

(They also emulate 030 cache and it's even semi-cycle-accurate [1].)

Hatari CLI debugger / profiler will give you kernel backtraces even if 
kernel itself could not, see: https://www.hatari-emu.org/doc/m68k-linux.txt


	- Eero

[1] https://www.hatari-emu.org/doc/debugger.html#Profile_data_accuracy

