Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1CD1FECBA
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Feb 2026 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209272; cv=pass; b=QfqFJdNNhf7eCoB5FTtR+xmUo1lEiUPS2jQGn9B+LwbKhGHNBgjQA22b8DrqZu4H7fPEJ1TZZA4WWWeBP77xaKja/LohPB528udN7B7gjhCY0NkC26wCZ3E2IqMTIGPKlvWFccAGr/rUphBv6LNvmI6fZYqSzzw8p2c2LHvlbQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209272; c=relaxed/simple;
	bh=gzPdifQNN1kwwnTAjndJp4o3VuNeG1AwtKZeUr0gEqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJcZM96Bwy6ZRPOk7ajCCQ4hAB3fPiHGfvygqlSxB5iykoMLaInTw5snc0GYrTqtueITFn4s3ka+AdPji0wCJPWyXFlbtd72iB70Ija6YgNboKzbDK3LhrUQXj63myeBxdcOMksUdNiTZvC0aFSYgB+l/CkAFFjAIUrcxbVv5Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=PZ28hTKS; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="PZ28hTKS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3543b9f60e3so2714129a91.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Feb 2026 04:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770209271; cv=none;
        d=google.com; s=arc-20240605;
        b=IqWLSUsnPAhtVDKjj43WDiOkiSDcfKGNR2PIZPJd8iT9lTexVpGL8TKT/Z9yYDgdjX
         b3EZrKOhk+uxjxTOKc8mtmH4+2P+t4HFFVsC314A3mUv4lhFoJJoQLEQUj6mJIttLsFB
         J70GO34Ktrm485KW9InPkeNx/hB6eydVMoIjvjgnS6gZSHjPQrA2f7Z0UXcPgNBgU0Mf
         OoK8bmj5Gb6eblS3FQ60113DmGG7Nhd6zZPA5r5DZe6brMguGSSmKhqmBvP+LR2MIhYa
         AZBuvevLt/oWL//YPrzX+smkc1ZSFGCYuJ/LQEThJewacbhTv5lLft2CsJrIoVJduP28
         IooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gzPdifQNN1kwwnTAjndJp4o3VuNeG1AwtKZeUr0gEqE=;
        fh=9oG8Yph4xpk2AbVn7mBXqG9fOU0CqsOWn8oAwcUl5Ck=;
        b=XcV2Gdm4wDhpa22nSCJQb4Gm649JzkZINR/4GSK7Z1igzjEMpZQ2qCLJ2oQVd8n2/M
         +PjJyjExZqjD2/t/WAEtOff1pMJijKAQkr5L7cUQaTo0e+hiwY5I38eNrJjhwjz8EUKW
         y/OtS9d4nIGbUnE1KC8reOql+pDOi61NesPmYTcqp5lLg7U4NGif29nFRvcs75MA/rK3
         RGcFWe8hasyvpDxLm9jgjs7EP8ReqBLkXEJ58BgUPuVMH+tYObITG4ysAUxeoEb/J+ih
         f3d9Movy+PtH36IyB4nmbKbJV4spzBwbJApqXUlD7SetXxxOBHIQLr/t7rv0r8EkbOzK
         iBzw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1770209271; x=1770814071; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gzPdifQNN1kwwnTAjndJp4o3VuNeG1AwtKZeUr0gEqE=;
        b=PZ28hTKSgFiNjW+Fz1bHV9zqu5az51jhsL4puTA4Qi1iAD0hzkdZgF7W4jMmImIzgZ
         yg6XQXzVAaglaXK0ilrkDcjxCjKN1CBUFN3wI37I/KRlG5N9v0O8BuLOe9KDU0zqM0AN
         Sv69x0JxYKaRTEAntJPNonz5J7XtM0yb34IiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209271; x=1770814071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzPdifQNN1kwwnTAjndJp4o3VuNeG1AwtKZeUr0gEqE=;
        b=Mn1Cn6KkMJJwdkbe1dvj9M9sQ0xu9BZCV+jr3nBzocwMdHIWWYyLpzhqROCIWEZr1R
         52x6mcEF2YOuKfY37KhYIyVOhZUMul7+Ir8iZwGh7VPW9KXg8dFQqLlRLfBhFlGaVPkZ
         xhrmS0RAKYOYTr7aTRmGIsRST+C0F3RyTrUV9DUMxWxvlSuWp7shab3ino9jvEXJRecB
         751CaTeADwqgTBGwcBNYOpwYsRRBYQpwSOvj5VNTmuiC9uWvOfyC9v4Py1tnTEFXodvf
         sEMXq9QaFnKNRpcUAKlTjqXHc0o0IsNRshKUnX3kQrEj84c0LO91qZzPLw3aFuCPTyKY
         7yHA==
X-Forwarded-Encrypted: i=1; AJvYcCU8LTJly08an8p93I9jPwKcQqzfdTogsXQXmawS2r2k+6MA63EvIEd93KtS98JYwl/PkbqslMyq8KDs@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwFJn3i8AemVaPjrJ+tYllWeanX0eTFcSvS3RlFRjTL5SLPsFPn
	4eIZgf4FvgdCvdDSNSqfqH9z2545T/EzrW9hse5nRqxYnMhWPTM9Bo0JqtxjegqoYkaQ07ZtrJU
	HiH7rXdAH4Kf7xD+FXA+gJ3EW+9cAYeFfUWi8xlo3gw==
X-Gm-Gg: AZuq6aLyeI0dsqlkmjt2cIYiXtqKvWD+N8bb16JYDmWvpQbcUVuwRITl5VpoKdCjQe2
	Bz6wh3//mlTIkm2wpyyf8GpwttnLCGU58vuRWIs4KqsAnPCTjs9o7cca3nO/cdyMqr/6+YjRGtW
	ftU2Fe8aoBW484bKETYpnkwCx3aHjcw7NUOT8wMPS1QAO2nD1wpcXLXUeER5Q7wbWOdwKti2qsV
	ZvV0npYUuYMxHj7LICoKUlkZ7QL2dFtCxveijY5CJdQI8kYVKa/YSVKF7eQfcbYH3RG7dN3K3bc
	UZ755E4j
X-Received: by 2002:a17:90b:2dcd:b0:349:7f0a:381b with SMTP id
 98e67ed59e1d1-354870cb817mr2271653a91.8.1770209271374; Wed, 04 Feb 2026
 04:47:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203170824.2968045-1-visitorckw@gmail.com>
 <CAMuHMdUMBoLd8cKXMK64qjGfTqQfK21mDAXMh8DdJHkL7QbDVQ@mail.gmail.com> <e7ddd671-6e25-4114-9d4c-21ecebe82ef5@vivier.eu>
In-Reply-To: <e7ddd671-6e25-4114-9d4c-21ecebe82ef5@vivier.eu>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 4 Feb 2026 21:47:40 +0900
X-Gm-Features: AZwV_Qh5NVjLh6HCd9GiRsalccZbQsoSI1MyoYO3Q0La5tE6o0sRk3zeCgTPlm8
Message-ID: <CAFr9PX=heS=ywLCidd8o_BzS4TS5U=GA8yv7itzNFp5nuwf2XA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add QEMU virt-ctrl driver and update m68k virt
To: Laurent Vivier <laurent@vivier.eu>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, sre@kernel.org, jserv@ccns.ncku.edu.tw, 
	eleanor15x@gmail.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Wed, 4 Feb 2026 at 18:09, Laurent Vivier <laurent@vivier.eu> wrote:

> Please cc: me on the next version

FWIW support for the m68k virt machine also just got merged to u-boot:
https://lore.kernel.org/u-boot/177007672356.4123720.10843284111217950440.b4-ty@konsulko.com/
