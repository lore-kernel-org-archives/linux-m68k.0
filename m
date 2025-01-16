Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9D26AE4
	for <linux-m68k@vger.kernel.org>; Thu, 16 Jan 2025 16:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737045431; cv=none; b=KKgoaYriDzfSa3MK7VMN9iLwPip8OC53HynXg/VqVDmO46WM2Zxzynt2gA7N6TaMIcM3rH0RrEMnh8cTWkFP1SFmg05y+FxFXv41op9KJcGoarBeXNb3jPyvw6c+jobVYBmisZQL2j7gV+GGkthtMMiYhN2vkBh1ipzUsw87yuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737045431; c=relaxed/simple;
	bh=sjtZ46X6vBGVStbdYlX7upxhO5f6AYZudJN2CtXdhnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=seZQdTOi+dbjh5YueO6Ih0M2uJeAAeh0/wOD7y7ho4hW5lwiLX0Qx899fSmQUULcB3OQavSPgI/y/Jw7ysHvz/f01icS8hiNRrEP0/K8jf38xl7ebU0ufNXTbj76SIhHH6RnXp6mQMJPiN3U/f1Q6kOHM4PWrJ3yvcqVhnUXFbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAWF2ESL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAWF2ESL"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa679ad4265so452318466b.0
        for <linux-m68k@vger.kernel.org>; Thu, 16 Jan 2025 08:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737045428; x=1737650228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hU2MS/JDk1hXuKKal/TMwBXQJf/SB4WaohuK6PodOQg=;
        b=NAWF2ESL3/284Bi19lgfXgKJrttJ9fA+7fhTl5HgyCWpHZz4i9kES3VHnRytA+1rdm
         SrLloaZGNdhB0ZIj9npgxl0x35fMDG0RbQiQR//rnwtd7sPPJXu8a3VODPZTfZCb6uDF
         wLyO4iNaSzCb1ADiYUSxWD4KnuTuwRT7xZAKR+QyAHedCjXmktrfZ24oye7ArGA9oeu0
         fzsNReWR/W/pHtn2t2QCJC2TBH2usJxtr9ILt1I3dsvJ688LPAh/RyDwwN2hHIUkQSt5
         q7egFGkGaMlTcDvVRJBBVlFThCE1XCg7cBj/sDFvwf2If9jw/7ImSZYMc1/zZ9LHDjBa
         V5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737045428; x=1737650228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU2MS/JDk1hXuKKal/TMwBXQJf/SB4WaohuK6PodOQg=;
        b=CO5EU5FcciDOo93NoIrAj4Vg7WCUb+z5HKX6ilzz+RCRY1oGk49vIbaXpo5IOH8g0U
         Lw93HwJuhxCdGCgvMFtsP0NtWyl2zJe9bSDolSrl5w7JNwz3TWhy2rrzOXMMM6O7Z2hU
         Bct+rzZ6NjdmWq/OFddBlMPrP1CpBcBevUrR64ZfirS7qzBgEgKFyZSakjLt6yltYuaR
         KECrAndYYotZc75pWBEKYPEZm3QlJMq1E2wvZeJn2wAk4I0qNNrWk/zl/EL1vwTFxGGJ
         DB1zQWtCyaumVvy4Pkgm7lyoIoZVU9e5elIbgOghNmQvfp2AuNmPYGYhJq6goSVlAgwP
         p+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV9LhzVE6kVw2RJcJEWEQSEa7nKCCH28d92axpguKRWrxRS+crrY2j+VeOnFOS3Uvuz7QhK8fEkw7ty@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUiBK6ux/0LRedJ02Bgy2el8A9sQOPd0OIpKQlLqyXLh/tbNN
	WexrfmNtZAi5yOWDcnXSwWjOkM2kuM3xFQBDFn2mEGoUiw/ANb4l
X-Gm-Gg: ASbGncs9RamKTdm2aXXIMrsZtHzlIk0dZP/gkrP1PHfeirZl6RWpndB9ZoLZ3/MHs1x
	O0dlDLZw7cvEsH8zZYt8bIWzYQyN7Bg1s5KtAAa4g62N6Y0IKaoRKMVo54OnJJM/vruPaWNr0xe
	j8W6QxxAklu0zNrRewJ0bMSL+oo/zoPcZNK+FGnleIiDXGORK/QlHjPxW7twz2lrfPgwXIqCwiJ
	H0vcH7PYc/DIEj8j/K4z9943ZLzDVZXNDPA3sqGwmAjaOEskXz7sNs=
X-Google-Smtp-Source: AGHT+IHgsOMqeXkD3b6slCq8yFWAyzCVb37BU1J+ZyuKDymA4f1mrPH6QGBXDHPg0u0Bq5cFGj3fcg==
X-Received: by 2002:a17:906:a854:b0:aac:93b:269a with SMTP id a640c23a62f3a-ab36e3cdb89mr272742466b.20.1737045428187;
        Thu, 16 Jan 2025 08:37:08 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:1f9b:dddf:17c6:bc46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c61e0bsm19469666b.29.2025.01.16.08.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:37:07 -0800 (PST)
Date: Thu, 16 Jan 2025 17:37:06 +0100
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	linux-m68k <linux-m68k@vger.kernel.org>,
	Kars de Jong <jongk@linux-m68k.org>
Subject: Re: [PATCH 0/1] [RFC] Commodore's Gayle pcmcia driver
Message-ID: <Z4k1sj8pP6KRUoXq@amaterasu.local>
References: <20250112150542.413179-1-p.pisati@gmail.com>
 <CAMuHMdUO0qms43yzQMA8hh1wd6VaDYV_0TYpggxE9S5ZVeoLVg@mail.gmail.com>
 <Z4je7T0zx0QmF9Dk@amaterasu.local>
 <CAMuHMdUi62FctEsB+k5m7Ue+WZtU_iQ=ppEhBmM1hSAAZJc2SA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUi62FctEsB+k5m7Ue+WZtU_iQ=ppEhBmM1hSAAZJc2SA@mail.gmail.com>

On Thu, Jan 16, 2025 at 11:37:22AM +0100, Geert Uytterhoeven wrote:
> >
> > i tried ISA_SEX to do the be->le flipping but it broke all drivers: it seems
> > like isa_insw()/isa_outsw()/isa_insl()/isa_outsl() must retain the host
> > endianess.
> 
> Oh, I missed you're only overriding the non-repeating variants.
> 
> So ISA I/O registers are little endian, while ISA FIFO registers are
> native endian, as they operate on the raw data stored somewhere else
> (network, disk, ...)?

According to NetBSD[1], word access to the PCMCIA bus should be le but Kars
didn't modify isa_insw()/isa_outsw()/isa_insl()/isa_outsl(), so that was my
original assumption, but i'm not 100% sure here.

1: https://github.com/NetBSD/src/commit/07364bf8b04818675b3a1a1a23424be8c90ddfa2
-- 
bye,
p.
