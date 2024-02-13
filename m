Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9754857897
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Feb 2024 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707835468; cv=none; b=sT2QzYIlJ8KHtxgjntEBmaHbznjSEX6S3Ze3ar2ezx3woFtgKtv+9o5VtDHLHOe87PgXxKabPlgfkxvvp0ysXjlDb/t2DB9Ytgwsx1Oz1ofp9aoUOLZdqxZJRrEXMjOEGyrW1yCZpxVekyy5VCAHwPUCi0AXX+ZjMsMRgMBl30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707835468; c=relaxed/simple;
	bh=4T6Z+T+8+wgSIZaaE8oQJZMCq24ZtSpur1maeFVGFmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/ypkNTiVtJYq2iIJ8x6VyoEH/FUu4M7IQcgSZaCM1nZzmhCdKwn9uoShfOsGhCGwqhlXAVRbUtVF1LUBoQvzEV9TRL1afZUOo8IUzemF/9ztZKy0NDdL5WEsB6I5s2RYndvX5sKv8AzY96x6t3HSsJFZNK1NlcZ7p46Chymg38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-607836d3c5bso8041007b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Feb 2024 06:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835464; x=1708440264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWOHboTTtc8J+GRIzyUUHApRBnZZYmJFISH7bck1uo4=;
        b=Rtb/7946i2oXRhxxjP+PvuLFp96cf5rCpjRosX9dXKYC25hVBH8Y9ZT+nCfAoQvWuT
         6J7KckR17NUF3HkyosJBJsd5oLuWpH71OUffO9Ke9OmicfB1dYG/k7wQvWkcuvJ75W5v
         80YJEvMySSLXgQHVwBPCbRldNollIlj8rWFAwxuIrlumy1AscOve1iWY1fuF600UXOLy
         3DJZrLmyDAHw/UMxwDOf+PKJfAyTdygqM9pwXjTtRHv7dz/F2bj/pAlHdU32ZMLrWDcR
         55zCUFXADigdg0KdJeLA3YHv3YyxAvpBTj8mlCWF58yYeWdPU57kzdlnlUK7otyqYqjS
         f1ow==
X-Gm-Message-State: AOJu0YxtkbhBDGBVyDsX8M5zi85+ElmGOniqyiDg9M7bnDD+v4/5G3wc
	QB8f32hCoT8GQ6EASlFCfTaCuR+tIDURrBAV/unHVD1C5WS431aBVDf6gki1UXw=
X-Google-Smtp-Source: AGHT+IGKOKVR24Njrr5w8zuR3XQsJVLCsVOVmwC4fEJwTMwKDssJoIVLBFIB/NNR13YqhzTE8sNFCw==
X-Received: by 2002:a81:8491:0:b0:604:16de:b563 with SMTP id u139-20020a818491000000b0060416deb563mr9366924ywf.11.1707835464329;
        Tue, 13 Feb 2024 06:44:24 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id i138-20020a816d90000000b006078cfca84dsm253341ywc.38.2024.02.13.06.44.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:44:24 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so3789929276.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Feb 2024 06:44:23 -0800 (PST)
X-Received: by 2002:a25:848b:0:b0:dc6:d738:1fa6 with SMTP id
 v11-20020a25848b000000b00dc6d7381fa6mr9937843ybk.6.1707835463699; Tue, 13 Feb
 2024 06:44:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213-bus_cleanup-zorro-v1-1-388ceed8e7bd@marliere.net>
In-Reply-To: <20240213-bus_cleanup-zorro-v1-1-388ceed8e7bd@marliere.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Feb 2024 15:44:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX472r7nY1QenJcG1VQWAF_Bx53UyXOWdPENTQKdDvLCw@mail.gmail.com>
Message-ID: <CAMuHMdX472r7nY1QenJcG1VQWAF_Bx53UyXOWdPENTQKdDvLCw@mail.gmail.com>
Subject: Re: [PATCH] zorro: make zorro_bus_type const
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:40=E2=80=AFPM Ricardo B. Marliere
<ricardo@marliere.net> wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the zorro_bus_type variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.9.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
