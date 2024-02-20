Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39974274
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Feb 2024 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708437356; cv=none; b=GJJ4s59i5O7gguDtozzMMZUacOCOJLiGz/9hmtlkqY00WioLoKPenxaRRV9tyllJyfYMD54c+qF4lqk2Xm7xv9t7bf1grmcYQT7L0QwXvD9iTT697DQ1ONGlpkWpSLhaqGlJi3HXHjxWDvZ1lYSo9f3x+9T7/k3dFCOghQe1/AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708437356; c=relaxed/simple;
	bh=CFBAEkF/q8ncI+9sPI0M6RjIXSeHLouADi9KF1CiGh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWfoTkvGalmYNvCPB638IC3LbC6CgWuHlto7/g5z8cpPGcD/sBGT9EwZkQzAU8a6GcMOOgjudcfoC8WL2MHcSeSxtKXN/9n38dWbR3dpmZA07jVPI9Nwe9FrIoPvesiz/sI97Fn59EwcZbx+rY5mBF1RZhRYfrAdGDBhjXQ5ogA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BF07610E8;
	Tue, 20 Feb 2024 13:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7567DC433C7;
	Tue, 20 Feb 2024 13:55:51 +0000 (UTC)
Message-ID: <590107ef-16f1-4680-8fd6-11df838ce14a@linux-m68k.org>
Date: Tue, 20 Feb 2024 23:55:48 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/tty/serial: Remove unused function
 early_mcf_setup
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>, linux-m68k@lists.linux-m68k.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20240219164002.520342-1-thuth@redhat.com>
 <c44bfc7f-7b06-4985-953d-185f8b576a5b@kernel.org>
 <CAMuHMdXc=rR9udEmMsCJof+sCxdoJryF49-Gy9j=DJqiHyUsvQ@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdXc=rR9udEmMsCJof+sCxdoJryF49-Gy9j=DJqiHyUsvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 20/2/24 20:23, Geert Uytterhoeven wrote:
> On Tue, Feb 20, 2024 at 6:11 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>> On 19. 02. 24, 17:40, Thomas Huth wrote:
>>> Compiling a kernel for the ColdFire causes a compiler warning:
>>>
>>> drivers/tty/serial/mcf.c:473:12: warning: no previous prototype for
>>>    ‘early_mcf_setup’ [-Wmissing-prototypes]
>>>     473 | int __init early_mcf_setup(struct mcf_platform_uart *platp)
>>>         |            ^~~~~~~~~~~~~~~
>>>
>>> This function seems to be completely unused, so let's remove it
>>> to silence the warning.
>>
>> And it seems so since the driver addition in 2007 by:
>> commit 49aa49bfd40d718095669c1c70c9d167b814e29b
>> Author: Greg Ungerer <gerg@snapgear.com>
>> Date:   Tue Oct 23 14:37:54 2007 +1000
>>
>>       m68knommu: new style ColdFire UART driver
> 
> Indeed.
> 
> Looks like the "changes to the ColdFire based m68knommu systems
> to use a platform model at init, and this is used there" from [1]
> never materialized on any public mailing list?
> 
> Greg: does it still make sense to add them?

No, it never really turned out to be useful enough to anyone,
so I never really pushed it out or progressed it any further.

So I am fine with removing this now:

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

I can take it via the m68knommu git tree if no one else wants to
pick it up.

Regards
Greg



> If not:
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> [1] https://lore.kernel.org/all/47254BEB.2040609@snapgear.com/
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
