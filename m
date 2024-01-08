Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2485134AC
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jan 2024 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="aU9hXBZi"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9b2c8e2a4so1646885b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 02:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1704709080; x=1705313880; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n+s3i7ULFHDXKn2RzndAY0qvbKNroYnauIf17/cWotw=;
        b=aU9hXBZiINMXZGpDGKHH+Hh9+nqCuvdUU5rV9EA+YNS0O1GBQvw2qBixs5AkIhyxUa
         kaUIHqS3g8RFEz6Lk4Q8+aIVI6q4L+LAAttgZNHm2sG1Qu94TPOeyn0GA8ySWrl3Sm+L
         v4wgYQiEKeaStK/pBCgoYoAwx2autPCI3CFMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704709080; x=1705313880;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+s3i7ULFHDXKn2RzndAY0qvbKNroYnauIf17/cWotw=;
        b=v94f/1ZQqHLh9K2rn9OK9UClMlgfZO3k9K+pCbhGsNrPXmF2txFoWkFntalnKBIANs
         PaYn5FDiVzdfDftqUHP8ryUR81uMwtLbCcUAbECQE8AGzbj3+enoVtTOLj4+NftO4aXQ
         J/gsVnXZO4oKITXdCgyASxA9JbE2DpZa1BU7flNZOt+yUIV6dnvy3vmkPtkXLgwJWBIB
         dMPsZEBsQ8MJQQWPtCd+yRVCLIfPuhAjXkaPhSRJrcLaJ3y2PiotIHsn2k6JU+nNDcVr
         LuLYPrrJoqcu0cXpi/0tZvEK+KaIDXUKFjO9ykckq0uinw/F3/F4LKo0B70AijnGnw+6
         mtBQ==
X-Gm-Message-State: AOJu0Yx2cW5hQL/y886W+kITzOMzkRWGjTkYYhqIAEID45YutyjNCgQr
	TMMs8vhTjba5Yq/6M+GW+MHqCg7uTe6VlWNuyuBvh6Iww/vy/g==
X-Google-Smtp-Source: AGHT+IGyPSfYxH/22q7ASb9c1WAWmZu4q6xeNojRnrTqhB37yGNb8zC6qt7WFB43LtXSHSzRyKHf+vfeNCdNFNxXlmc=
X-Received: by 2002:a05:6a00:1ad3:b0:6d8:e153:f884 with SMTP id
 f19-20020a056a001ad300b006d8e153f884mr7325344pfv.30.1704709079932; Mon, 08
 Jan 2024 02:17:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108093221.1477020-1-daniel@0x0f.com> <20240108093221.1477020-3-daniel@0x0f.com>
 <CAMuHMdX44A6+BNByuvbCC2gcM5vAipbaGAK7L8Vh8q3tMynBbQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX44A6+BNByuvbCC2gcM5vAipbaGAK7L8Vh8q3tMynBbQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 8 Jan 2024 19:17:49 +0900
Message-ID: <CAFr9PX=g+tVRYwhXkrPK421RW7ba1M1H2pM_AR6sJNx+oTFwjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: Fix interrupt stack frames for 68000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@linux-m68k.org, fthain@linux-m68k.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Mon, 8 Jan 2024 at 18:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> I think it would be better to use the classic m68k stack frame.
> That would pave the way for building a single nommu kernel for
> MC680[012346]0 that runs on e.g. any Amiga.
> MC68000 and Coldfire are incompatible anyway.

Ok, I'll work that out. I have an A600 with an 020 board so I could
actually test it on real hardware. :)

Cheers,

Daniel
