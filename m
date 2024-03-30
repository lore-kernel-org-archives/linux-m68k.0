Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224EE6FBE
	for <linux-m68k@lists.linux-m68k.org>; Sat, 30 Mar 2024 02:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711766781; cv=none; b=gR6AHUuuFtja8kNNauhCfiyeyIUoCLQfxiXNFo1xlY/D9GdZ2db1QXJ0B4posp99Re0z750VcJnmC1ZC4Y5XFZQfO9V/H5k8rUhDkbvzMKowzaxQN3n14TWjgOxdu/PogEPTM2s7r7BXVTc7NeEgF9MKXZKohaY9J0XClVe43k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711766781; c=relaxed/simple;
	bh=FGJ7vI4LhtxcEV5msmxI3U1FCjExZNOm5eJenN5e8Po=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IwwCH4yTq/8oQGX6u9gOGWy2K5cfTmPT30S9nD9wcEHa7mzYrGZyyKLycbjogP24AV736fIuB6o0bOAHcHS3Sl7L3ayuzo34Bzujk53gitNA1QCLr9QRaRLRHvQz5cgfwz8du709ykxgWx0micOVxL8I7chHHSeOI9kdBoL2H3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXdMu39J; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXdMu39J"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29f9af2e0b7so1750158a91.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Mar 2024 19:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711766778; x=1712371578; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHzHhZ+smqMcj31kQY1U2okGO2VO2U/Yk85awUc+4Yo=;
        b=CXdMu39JKw6oPhZGtUU+8ozaHc2JBFeoaJ88YYU9+u6nHAvQCJa6ac29AphvRIB4cM
         u5So0xDzKl9CT6SO2fKZdAfHbiESOXVsgXnIdQjJjIWOnA41pE5i7MUnj+fBPKuNBcXO
         zVhfni/jd5w7c1ryrNjOXTCEK7lRCRnZ3Q9OpvJCrrjTCH3s7N4G2ufQkoZ7t+2oXQb5
         +SKamtstbAbiwCzq5A63eiN0lvnO5Vk2X71QeW9vn6022toWx8Siu+3YEAcjKQAWxMo0
         gS2YcIQqbEV3rVMthpyJfBAHBygsgKgyVF+8+MXPxneLwTHf3MzUfZ+2mAUyrN+S+KSL
         mE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711766778; x=1712371578;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHzHhZ+smqMcj31kQY1U2okGO2VO2U/Yk85awUc+4Yo=;
        b=ZfQu7XDnXUg002gPTnIBjrc7hwB0oWfHMRRBt4cE8uJOxTeI6Ov1I+KRwz3YtE/289
         iK75gtCMgUuWFzZi/y4pPZhyK0c49qvAtgFBvjrqHmFzJ4p4m3P6SAkUpVo6nGerN4CX
         hvXpAfv6/kFMg4Ku4OrMV47jut77y+aImrVRD+duJNnT4FJFAMXzeN9gA5aUspydCOpR
         +Oawo5PtNUbL8li8vY7hQBUDpQ9zNpPD6OPHoZ7rzNRnNx8mK/MsbreO5kHHZBAUEUK1
         1l+q87hKGt4BfvZ7z9TZUVYlgsnZPl/BYp3h6HD9QX99P+WygC7wGCo9/xGKxMNyUreD
         AO2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCq2p3SYKiY2isxUO+aGvIp1yy2ZfDifxWU1p6bMeM8uBjPLM9OG78tCLvBXEw1v7WOMHLHHbL/Ftp6ayERhNF2ll4RA8KM0Au337zZBsu
X-Gm-Message-State: AOJu0YwSi/fnHmPo1YNLC7lLP0sXP92eGnZoImwg8//dYG5/im9bR75y
	E5vqWm3BIqCFZdqfM3EB4LcoTnXrLOYdCNJLb1fw45ICZahwVpgajR5cITDp
X-Google-Smtp-Source: AGHT+IH59nfCAqAopCbOAEKuFO04x6oQdF5WQdt2OUwt0qqXWORZaZ1OnOor/vb9Ak4Y7MxL0Y7XvQ==
X-Received: by 2002:a17:90b:3597:b0:2a2:f9d:f6c6 with SMTP id mm23-20020a17090b359700b002a20f9df6c6mr4060520pjb.8.1711766778406;
        Fri, 29 Mar 2024 19:46:18 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090a490100b002a04eef22c5sm3919218pjh.44.2024.03.29.19.46.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2024 19:46:17 -0700 (PDT)
Subject: Re: Spinlock debug, was Re: [PATCH RFC] m68k: skip kernel premption
 if interrupts were disabled
To: Finn Thain <fthain@linux-m68k.org>
References: <20240322014805.30606-1-schmitzmic@gmail.com>
 <fcabda73-4b16-ee2c-e993-2bfcf392a26a@linux-m68k.org>
 <e89bf618-2fa8-7cbd-16ed-d021a9a7f740@gmail.com>
 <948c12e4-e85f-a86c-ae95-a1eb03ca026d@gmail.com>
 <40928e38-0de7-75a6-d5f7-8c913155da03@linux-m68k.org>
 <5e344842-0b19-1f83-dc77-51210a8880c7@gmail.com>
 <1b9ae156-9dac-b11f-5ddb-fb5878b3c9a9@gmail.com>
 <acd34add-27af-24a5-9af5-d40cab71c651@linux-m68k.org>
 <597ab0b3-ac1d-443c-95f7-4f1bbcccae1f@gmail.com>
 <c8a063a1-c72c-9aed-65fc-b2d87f8c7a9b@linux-m68k.org>
 <546b3960-7a1d-4989-82ee-2d7d56a9d609@gmail.com>
 <fb93b00e-6cfd-f2a8-7937-1266d7bbfc23@linux-m68k.org>
 <570d4e69-e73c-4d35-8538-b5530c714c55@gmail.com>
 <14f7ba29-dc96-1f46-5b5e-aa6c5bb3de3b@linux-m68k.org>
 <3dee11c5-d0dd-b61e-c7e7-bd12841618ba@gmail.com>
 <e926619a-3b6b-8045-8fe1-59bff5e420db@linux-m68k.org>
 <7aee9fd9-1c0e-4874-bb86-e512a7c0caa6@gmail.com>
 <d19e3768-7edb-93ac-3993-af12259b7705@linux-m68k.org>
 <63db5f0b-2a7d-a057-2cfb-fefddc15bc3f@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fc5ba67e-3d6a-2fef-ca85-6d5039da1af7@gmail.com>
Date: Sat, 30 Mar 2024 15:46:11 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <63db5f0b-2a7d-a057-2cfb-fefddc15bc3f@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 29.03.2024 um 08:54 schrieb Michael Schmitz:
> Hi Finn,
>
> Am 28.03.2024 um 15:48 schrieb Finn Thain:
>>> Spinlock recursion in scheduler_tick() doesn't look possible from
>>> reentering scheduler_tick() through code in its call path, so the
>>> mechanism there would be different.
>>>
>>> We did rule out the VIA timer interrupt (or MFP timer A interrupt)
>>> getting reentered, right?
>>>
>>
>> I never added an assertion to prove that because I don't have a way to
>> reproduce the "spinlock recursion" BUG reported by Guenter.
>
> Right. I can reproduce the bug in ARAnyM, so I'll check that the timer
> interrupt isn't reentered there. Doesn't quite amount to the same thing
> though.

The MFP timer C is not reentered in 66 boots even though I've seen it 
appear in the stack trace of 8 recursion warnings.

This was with full preempt - no different from earlier when I got a 
similar fraction of warnings at boot.

Cheers,

	Michael
