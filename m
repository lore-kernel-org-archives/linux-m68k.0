Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2DE6E5FE
	for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714031564; cv=none; b=fF/VyIAZ1jeJ62B4Cws9CjhayW5U4QJ7+xJhoOfe495ndJZOi9MxcHKlVuC/NZcPGJ9Y8uVM50j9M7WhjTLbFGCUQBqqwPdz5YkvZY07u2NQ4fPYtj49XQ3RNv/n8rwgrVzeY/NuhpAwndqPBIuzrmry6WplppptuBPiu0FWLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714031564; c=relaxed/simple;
	bh=8wjhQFMCNWS4DbfL5OFO9jM6lB/E0SHg7FVpCjTrsns=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qtuG6tENsscg7ARdqmb0xGznDSW+3MMVTO0sMyzctSb5FYOYD4hDL+jyDz7tOH/m2tPoOM0z5vFgsZ8S1jc/PEBh942C3YWbL4D3WFZZbRknXooIm9F1tRMND9ilcS3ntq8y9wDCAOO9KGq8REK4nK8/sawE8sFU88GKsdZMUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlSsgQEg; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlSsgQEg"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6eb77e56b20so437065a34.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Apr 2024 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714031561; x=1714636361; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mdOXoY+t5/Zd/IiOGnBPKKSbtYjjTJUtZQ88eztVg8=;
        b=XlSsgQEgA4bL5swXsrk1Npw3R34EMfD8q7FftbM1IBMyO30FW7PVLnglGh1EXX6GwT
         kE12AVmYGCehRZAWzrAv7F26fKU4gwz3xrpOqPWR7QeX0yqK1Za7SmVxSgmdSdF29XsQ
         5IS+q/BX1EqxEfeTTEIe3t9B647Vf2Rcoh1kmZJ7iF29G7QzNSurMb/4yKoG/NUvPovQ
         UWMUjsRSCTTKCieLkqfSmI10dYF82qVLzU5+Sv4nlCk45GbGcZZ5sXl8qMOaRZQNFVym
         tuJ6dezLH2y0C7QG7LTZBk7J026VGdp4xx72rjvH2TsA5z/UHs8tP6ShFyxzit4TMhRZ
         gMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714031561; x=1714636361;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mdOXoY+t5/Zd/IiOGnBPKKSbtYjjTJUtZQ88eztVg8=;
        b=DM4aI2EPsdRNOxu86GJwtZc6U0akbqEOjrlvQSCGqeo+bnkHHUj1JG/CKiJS50FI4Q
         yliLZ9WnqgQ4N0D/VDTG5sLTh1XVvkewf4Rp7gjOwffiOpxMbiHQ7BVtqkdxAE4OM/GT
         LD+82fK/1fX3Rn//+ilO9t+HypC5TFO0xYvY1BY8QMJImVgIrpkhdKjo3PKiZnP1aVmC
         w/F2yxDLma4ED0eZkICkA22hxV1+RxxMh1t540BSD2uZ9EV5p1/GRD++bMVbWo26Xeii
         jXXqsYchD9YMr8kqUfO6lWcKuiWUkXwdmyaBhLkT8g9zzKAK4dxXrtTSx8iq84UbD+Mx
         Tu1g==
X-Forwarded-Encrypted: i=1; AJvYcCW+1DlQHJyuTUrZQjySPX7aRPfUzsFbvHqXmyi3GkJR+tPHmlyGaCoRxO8iGSD3DAAX2sA7RRPwLag+z6LX3wm/aS0qJwpPBSd5pZcxR5iU
X-Gm-Message-State: AOJu0YwbdEfOdMeyceghG8chkfOVgMDbmGYchAiDosDDh04U3xmw9pzZ
	uiZZ3uUiOgMfUxHpwaqFQhDhLDVbzoWBdhOXhKT44Ae6Jmd1+VaTkob51g==
X-Google-Smtp-Source: AGHT+IGdYxt4XkH67TwgpiATycn84XfnlzrxUWISnr46cQIMME66hxzAZ7na4iva2SffHDgGKyB9Cw==
X-Received: by 2002:a05:6870:330d:b0:22d:f83c:fb3a with SMTP id x13-20020a056870330d00b0022df83cfb3amr5826242oae.9.1714031561486;
        Thu, 25 Apr 2024 00:52:41 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id a20-20020a056a0011d400b006ecec1f4b08sm12567210pfu.118.2024.04.25.00.52.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2024 00:52:40 -0700 (PDT)
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
To: Finn Thain <fthain@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com>
 <20240422022943.13775-2-schmitzmic@gmail.com>
 <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org>
 <5d1a552e-f66d-dbbb-5630-42d22870dd15@gmail.com>
 <36a70661-3bfc-46f1-f211-fa87f883371a@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <eda396cb-9c7a-f312-0159-2d4c411798bb@gmail.com>
Date: Thu, 25 Apr 2024 19:52:35 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <36a70661-3bfc-46f1-f211-fa87f883371a@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 25.04.2024 um 18:32 schrieb Finn Thain:
>>> This oops indicates that we are going to need the final NOP that was
>>> in the first version of your patch. My test program seems inadequate
>>> to show that it is safe to omit that NOP -- we would need a test which
>>> doesn't jump over the MOVES.B.
>>
>> We'd need a test using any number of longword moves expected to succeed,
>> followed by a byte move which is expected to fault. The current test
>> would attempt to do a byte move, but faults during the longword moves.
>>
>> This requires running the test program in a directory whose absolute
>> path is a multiple of four characters long, and setting the start
>> address for the getcwd test accordingly, so the newline at the end of
>> the string is the single byte left to copy. Does that make sense?
>>
>
> Yes (I take it you meant NUL instead of LF). But my concern was that the

Yes, my bad ...

> test program passes a pointer like 0xc0029000 - 1. That means the final
> byte will land on a word that already faulted. I'll need to add a new test
> that passes a pointer like 0xc0029000 - 5.

That's what I meant to say, yes.

>> Incidentally - what is the path this tests is run in? Any path longer
>> than five characters (including the newline) would have to had looped
>> back to the first movel, and faulted there?
>>
>
> It was /tmp.

Right - so if I'm right, running the test in /root would exercise the 
movesw path, and fault on the movew. Using /var/tmp would loop back once 
to repeat the movesl, and likely fault on the movel there.

>> As you said before - we'd need to know a lot more about
>> microarchitectural details here.
>>
>
> It's hard to be certain. We just have to experiment until we find
> something that works on the CPUs we can test.

Right - I'll try a few of these ideas on my 030.

Cheers,

	Michael
