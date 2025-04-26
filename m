Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C207F2A1D1
	for <linux-m68k@vger.kernel.org>; Sat, 26 Apr 2025 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672989; cv=none; b=bfgOoQ57toBcngFzE1moGb+dFFpKbfy6zbDIcOMNRsYF9hvcwCKCnAHAXQ70zCSTfF5s427fn6rKYGdYAGY/aCfTQ4nT6FLA2k0flMlAyzr56UCxBSugTSNw799MqRfgQk09qeeuNB980fIlDrECMJivwsIdCT1CuDkqCP33Pw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672989; c=relaxed/simple;
	bh=TrjXobdC90aiaVYJS8Yxpcn8NpZlegdCI/+sCJqaMoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNGN6l2n+rTObQTd6KxCg75I5LTmYrt+FzcnafVE6/K4BTKzQMbNFUOhgYRUiTpwmSgJnOoIlpWmqR3B5KC7VGzFap28Y54+vt+1BOUvJe41WePO+TxjrKtzVh1SMtfJpAAF2jDggP4EC3DuNOCJRW4u/TaFz5m5gaLjZ/vg3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=G8OYn6RV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="G8OYn6RV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30820167b47so3295230a91.0
        for <linux-m68k@vger.kernel.org>; Sat, 26 Apr 2025 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745672987; x=1746277787; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TrjXobdC90aiaVYJS8Yxpcn8NpZlegdCI/+sCJqaMoI=;
        b=G8OYn6RVQSDqkXv3ue8YtDBU0Uuw3cA/Qe/FE4rQOs+xOJrrqUQKOeNsgoRaxQ2347
         uY6Ho3K1oMTW23zNkJgQ2+uRT12l0WecniqeepvFp1d3RNi8up2sc4TchllMDs9GkthQ
         qaKGI+ylR7/AbaT2yFSU8i101WuKOWdV7aoZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672987; x=1746277787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrjXobdC90aiaVYJS8Yxpcn8NpZlegdCI/+sCJqaMoI=;
        b=n1n+BFodIrZX44/2jEyVQn0GlZzfMlNIKa1oWCUQNQWQNyY2Nq8UlrCCbkk0jyiOL7
         VVyMUX6bsaSkb9diYqREWifoiEM7H+alvF+w6z5JAmbDRXKbUfeTYrdPoDu6oRqFd8j4
         Z/mXroNLYrLgW9bsMbSseEaLcEiJ4XS5G1bZrCXUd6n/V3R53oAVgo3RNXZBxC3Gh1rf
         AT92Zf2bx7i4a5R39ItZf85mrnXAkX4SOYWu8Itm7t3gyuxmC7XwFDPg1vTTfVydhF3x
         JJMqngfqVkmvu7oR4m/ml/GYXRfVMbo9QzQ8qbO4dBqyWWRK43TIfJkLSHbCoPl/HTPk
         HbKg==
X-Forwarded-Encrypted: i=1; AJvYcCVvkeURvzm3nBWEEi/Q7zZbAZ8ydiK0Akb+NP3z8bE0h6auhryyHfRVHmOibS0aPXGSx9isGlPQFfw+@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAbJ3Mc7iN2HEUROlvoaFPhsgNdNv6/D5I3vowUzcCe/XqViE
	1L9Ag9TPILg/LeiwmDxF7iDVEIxb65csmgfPfFZeVyyP+Tuc1WsM+gSzraj0KxJZUKoizbeZW5O
	LxYL8bte2T01ptKDB/ttKcFSF6ygjHws9l5BPuw==
X-Gm-Gg: ASbGnctJUJkIXdGr0nDB5ok6gLB4JVZlIuJpi0/udwTFUDUqr9BelY4N4V2AD7u+CDc
	RdjAbu3WYAA5MF76cvLFZ7ywTN3CbW0bO99STiMDityZ6OqYJePaWi+QA5G4vevA7sC0Pn3IqbK
	AyDwtFsHQUOaghZU4R1WbpB7hmFetl65FYSQjO37rc3R+rAZUksq/RVj6k
X-Google-Smtp-Source: AGHT+IFJ8jroVMyUx46fuQkn5I3LWI3lMSwo+PJo+v8BlHjbMXEDdo7FPKYRBfs7dbf21CFrjeWTjH3Cwc5FS76f3UA=
X-Received: by 2002:a17:90b:42:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-309ee37b550mr14275518a91.7.1745672986837; Sat, 26 Apr 2025
 06:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426041212.4141152-1-daniel@0x0f.com> <20250426051423.GA8239@1wt.eu>
 <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com> <20250426065613.GA8661@1wt.eu>
In-Reply-To: <20250426065613.GA8661@1wt.eu>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 26 Apr 2025 22:09:36 +0900
X-Gm-Features: ATxdqUF5EkdwYJngK6gRuGlAEq-Y6P1m84eowWORfZZjV9CfX2nsT1VdlVXuheU
Message-ID: <CAFr9PXn8-y9eq9YeOAzAs40WJM6Z93O6LYr_0PwMdT8TqiSnaA@mail.gmail.com>
Subject: Re: [PATCH] tools/nolibc: Add m68k support
To: Willy Tarreau <w@1wt.eu>
Cc: linux@weissschuh.net, linux-m68k@vger.kernel.org, geert@linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Willy,

On Sat, 26 Apr 2025 at 15:56, Willy Tarreau <w@1wt.eu> wrote:
> OK no worries, my point really is that it's important to implement the
> test for the target platform. If it's mmu only that's fine, as it will
> ensure we don't break it in future updates.

I sent a v2 that adds the tests to run on the QEMU virt machine and
seems to pass.
I tried the user mode as well and that passed also.

Thanks,

Daniel
