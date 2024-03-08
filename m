Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6FBD29E
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Mar 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709885215; cv=none; b=EEvi/zf7r6a68ZNtPMVdPh3yQitAJlcebusD1io7j2BtzIjARRNqRmWnVM7EC9EmiURQV7pF7AoxBvC6hT+fpr1p10qLO6COytlsURcJWq8StCdAe7gWQAIwzk+baGy24Od8u/AbQjUnjDGTN2FyNF88Z3NiHDkQbEX2H55OypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709885215; c=relaxed/simple;
	bh=hU9Gl/VlQnFnc1rpd4rJfuVsnCua3mrdI/BMwhHryUw=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pZzrXPt+lHdwZUASn6QgtzN6SGVl8WzJwDasQo5QrNqBMcV9y+zUI0MLSVJOgS8nrrecGgfKKV/n9ZIYMe8NXmL4xTddQUSqXOGiKth/zwOuSXrrj9nOqAB9iAMMDO0XGnke3wAItR4qEJsC5/nM4jzt+8eOgysdDWD1kLQUep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6+sXcoK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6+sXcoK"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so1383832a12.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Mar 2024 00:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709885212; x=1710490012; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+czmLI6L+x1FYm7QWVANG6jvWvwGiP0i0Pfi6UZSkc=;
        b=i6+sXcoKZ4Ehgfl9rIc/UO5aZT+HgwoB/0VY18nDNy9qU1Vm1iNgq5zJEbXBszHHhk
         yc9vAGqDCbXGmNUqjV8N6Vw4SVotGMyxqoOYT5fu7x6Y5w62b/nRlIvHjk/t55yo9eof
         664u7DQVjqJI5GyLFIIM8111sKwvM2t+LuZvMYApF2NXuj+q0imGWWD5gnkyEivrWhbU
         8YR6zYGGKE5wKj57i/9z+eUld2a9/rFZCSzA9o9l40M50kE1gzGSDaBjGXVzjksLzCUI
         mKaHc+n6lFCkVXaPTYuoF4RpkCBfGUqusAiGg1AxPI/TYaPsQhfc6We0xodUnubVpXlp
         Fsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709885212; x=1710490012;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+czmLI6L+x1FYm7QWVANG6jvWvwGiP0i0Pfi6UZSkc=;
        b=dDh04Un5o+PV+Arll4ShhSFPoxr0ufAf1jQhb60fTjUKLgA+/gmpAVOnxwSWg3rE2Z
         nHv+A+4rgaoFyXtQz0lpSKJk8zYQ+BkvYwOdTDW3KpIfDJagSpUSlArv2Lslm5ZqodOa
         f5RhnwWrSXTWVvOWLWnLzB5KOhLizuxmi2h6MclIebz0k3DyM53b9clE0pIkTfJj0Wxz
         bj8bMYOUkHoQ0XUBSC4V3HFcD8PstlwdDkT5sxVGpEvQHqjPRqtvKlzEBItHYFhyu4iS
         u7qCL0eBIGwaVdGe1eu0/dORZZfBlYZHJlcGAMSlklg++6p6ECPcyODavPx+6u1Ym6te
         tk3w==
X-Forwarded-Encrypted: i=1; AJvYcCUUYEjkdA2mf+JKKtKgl3L1AH7vN6w4Nrz1G+5FxIuZbCA3MIk/IE5g+m9a8EfyTFdty2Nodc+xQCfem3KSLU2HuCD580x23HUk+afBAThy
X-Gm-Message-State: AOJu0YxjShDDLG2oY1nZ8yl0eisBTSSqB59SOGbGCq7Vj2nSCNGMBdNo
	utQ/1Yzxfsgpis92SFs3wnLniVdOZRzPP/+61t+N0wTBtsePujKHO+M0M8dx
X-Google-Smtp-Source: AGHT+IFFyGT0EueT807s1hhfMr1QRqNIU95N7k2gZu/EsfFL7sQth5R2DAZ6WFyY4iXTaDnxQL7BPw==
X-Received: by 2002:a05:6a21:9204:b0:1a1:682d:cc4a with SMTP id tl4-20020a056a21920400b001a1682dcc4amr6608148pzb.43.1709885212447;
        Fri, 08 Mar 2024 00:06:52 -0800 (PST)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090aea0800b0029bb8ebdc23sm228779pjy.37.2024.03.08.00.06.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Mar 2024 00:06:51 -0800 (PST)
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Finn Thain <fthain@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com>
 <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com>
 <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com>
Date: Fri, 8 Mar 2024 21:06:46 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 08.03.2024 um 13:56 schrieb Finn Thain:
>> I realized (belatedly) that scheduler_tick() does not run the task
>> itself but just causes a reschedule if appropriate, so the probability
>> for this condition is quite low. The question is - does the VIA1 timer
>> interrupt ever get reentered?
>>
>> Can you add a printk_once() warning when you see
>> arch/m68k/mac/via.c:via_timer_handler() reentered, Guenter?
>>
>
> It's not possible for an interrupt handler to be interrupted unless by an
> hard interrupt at a higher priority level. Maybe QEMU could be so broken

Right - not sure why I remembered interrupt handlers lowering the IPL 
there.

That leaves other users of the run queue lock. Queuing new tasks would 
be one obvious such user for the init task, but that is run with IRQs 
disabled (we'd see these warnings a lot more else). And comparing with 
how early I see the 'cblist_init_generic: Setting adjustable number of 
callback queues' message in my boot logs, this may all happen too early 
for init to start queuing tasks.

> (?!) but recall that I saw this BUG on a Powerbook 180 ten years ago.

I'll take a look at the scheduler code from that era (though probably 
not much has changed since).

> IMHO, Gueunter would do better to instrument the spinlock tests on the
> assumption that the locking in arch/m68k really is correct.

I've come to agree - maybe logging any run queue locks taken by the init 
task with IRQs enabled might help?

Cheers,

	Michael


