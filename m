Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F53126A8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Nov 2025 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463336; cv=none; b=U9dR/BQOHptGej6RE+xO1NOXUP71Nrx/V35L+xvv5NIsTm7Wwjd/Jt6cS3+NtlhVSP8L2bcfelx4YxC+2RCquyKXBGhIPuFSJx292tfMqCk0B/3/FyYvNzLk/IBj+w/s0WD4ETm1Wdd07t7/6sbizc3mH2jwLPPcKkevmCbWJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463336; c=relaxed/simple;
	bh=hVIBghI4jSf8k0WG0hOLyrrSNs/IQ/Qv4RL0GymBngQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOs/ahNAhEKWFF/9tZ4OMGGYbjK6fkgFUa0Q3LON0Tjpzc0Mof1w6s5BHiNkplFn3fapSqSeGwWT5mSK9D0av8tqDqVo1+zi8gRwm8DQu+tpOm1d/6eICqv5JFFQisOLulDmfcAWxvPqx6/rMOxR6Wc/+pDca6VZmE9MbolAgq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=CTKZC0Kp; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="CTKZC0Kp"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso4075800a91.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Nov 2025 02:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1763463333; x=1764068133; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVIBghI4jSf8k0WG0hOLyrrSNs/IQ/Qv4RL0GymBngQ=;
        b=CTKZC0KpWaGjG/e7vG2K2C8cZWgg8tAX08flJwPiTMH6JLg6ISOvA7cFiJ/GaE+zFG
         3bb2rX6C4wdd+wVqmgrlJPfqJIhF7P41vEQxhbmOS+mCiLIS8lXGQxw+hamiO7dcfhX0
         QERMnU7Gkq3A3SJcxMy6pycjrebfQnkMloy/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463333; x=1764068133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVIBghI4jSf8k0WG0hOLyrrSNs/IQ/Qv4RL0GymBngQ=;
        b=AW9VkNYIbwDZpn65/RG9sidZhSJBGXmIb1Fov+vWRlz0+RgIRNOtkfw9FOJIVHvGTC
         4xAleSlFLryKOzab1hgP5cceTNLFIfA5dm6kN+9vTYIe380fqfE8Pm+ruMbBwCy5+h9g
         o22TRXMWur929He3hi1ghKmC1o6VYiB2PRkQD0AkrMzWpjOhx1NZx+5CjlJ8cd9DUQ1B
         1KB/KTLGTLZJ0LjZO/EHaVwiBzFELiX2BNMncQ7SUeFBBcSP7d1nrVWWe8ybLJ+q5Ye4
         +pKj5bxpZm3byepHfvneVenk8mWnPHXXDpUCc1xCs87/IMHMtC6H5vQNN/NrjeGrWDRd
         pe1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxU29qPGLwofc14CSjtgfiMEbZtrD60cPb32Yh82X27UkPG6Ooe7yKNHE/DtgDGN6GLiFq1x3v3L22@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwpAb2ZBBRyN5gVy3LQgqVWaneERViZwsiIRhTipDJCe6Xbcvrm
	7ub1Xh17lLkfBlk2Q9bjRxS41vR2CICs1csfSyjFB1BtvdNIxXJr7x8SYHr0a7GLtBmcZxBQBtq
	DyLVAyJrNne9WAymw4l1rlFKHXJeENuJoUpwVugpu+g==
X-Gm-Gg: ASbGncuHl+qC5XXeXKwvx9s5IpM1WxGnvsLxF7m4dpxe1+RrPlNIgJX6oIVQasCNjL2
	UnLfXCCByoVNNTdPxnOzgtkSup8/A7TLo/lN9Oi3TD/b280KNLXTmfp1BbPd9D+9C+Q3S8jO3KU
	8ldspdvBWlcAVRAcrz9Zb1nvCh9WdZx5cQJZ+fGkrmyJkKVglikMwDTzoDL3IqwaZ4gYdNUOK0o
	uveNrSv7eRyVBlUQ900/xaT8svDVpQk9Kot05mLEnrfVBTsH7ygKQ8S0bqv
X-Google-Smtp-Source: AGHT+IE7i9uNnYx4wNTU5Zb4iu2IIg6/0OqWRHXbHa59fPXjbDEDxETwXRbkDUHXzLE1UohSBZDhhZvsw0UphB7tgxg=
X-Received: by 2002:a17:90b:4985:b0:32b:9774:d340 with SMTP id
 98e67ed59e1d1-343fa7607cdmr17730399a91.33.1763463333357; Tue, 18 Nov 2025
 02:55:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251116220508.1513445-1-daniel@thingy.jp> <e5ff379e-b679-4513-b390-fa9b604999f4@kernel.org>
 <CAFr9PXkzhEEsSUXWCtpHaX6DWEKzX=xCESSpzbSFoJgf8mrz4A@mail.gmail.com>
 <126822f3-6f11-d02d-43f8-1b5e6bcc910a@gmail.com> <CAFr9PXkF4CUYUNaYQGuadAm5fCn65hMJDdGo=zwcPDaq4zOxSQ@mail.gmail.com>
 <292be779-a36b-49b5-a9b0-9a5aa222fd0c@gmail.com>
In-Reply-To: <292be779-a36b-49b5-a9b0-9a5aa222fd0c@gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 18 Nov 2025 19:55:21 +0900
X-Gm-Features: AWmQ_bkS4ZgmzNzM8AeJv1X9bEt-Ka7ITMWasxA2pCJwsT7JknKFftA8tF7HuO0
Message-ID: <CAFr9PXnutp0X-Rm9MQ=qYaFE5fPuDLRXCQBNRMwEYMKT=KeqHQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement kernel memory protection
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Greg Ungerer <gerg@kernel.org>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Tue, 18 Nov 2025 at 08:14, Michael Schmitz <schmitzmic@gmail.com> wrote:
> I find the head.S assembly too much of
> a headache to change, but that would certainly be safer.

Yeah, I'm going to avoid touching that if possible. :)
I think I can be done from C and I think I have something working but
it's not pretty.

> Wasting up to 256 kB is a pain on 030. Maybe rather skip protecting the
> last section?

Right now it's more than that as the end of .text needs to be aligned
to 256KB and then the start and end of the RO data need to be aligned.
It's about 512KB waste on my MVME147. If EXCEPTION_TABLE(16) was moved
so .text and RO data become a contiguous region that'd make it always
<256KB padding.

Cheers,

Daniel
