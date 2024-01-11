Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A5D271
	for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Jan 2024 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdBsvD+c"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bbbc6e51d0so3481150b6e.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jan 2024 23:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704957696; x=1705562496; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yy2lzqaTFfa02W+7q6UCYddcpHLmZArhRiq65UjnToc=;
        b=TdBsvD+cj6N9gh9iYwJYfadTvLbwGUhunDzIFOCZ12H7btlfzpNNdR2DultMxZleQZ
         Vbdbro0aoylY6sHxf6Jgl8deXIONq9ide6ufmZNo2phD4/kuY5iSA7fXkRH8HtnTjYxu
         zIlOB4YB4TOdDZgZGlfnbrIw127oSehhIqONPcJRyfbtCmv0TcQc3XIm4m+OF1ETRJZ7
         pj4zWTSWVPoULRlgvd5DgbiTVTzO5A1CBM8rSc8taWRIXeGOPhldG6/bO+88cptt1nQb
         Q7cGCyXTvEkoygsACrTgajM8PSOgPladzKefA1ip/nZAkEd4zWMv5hwuoZRhxjUemnsG
         JgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704957696; x=1705562496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy2lzqaTFfa02W+7q6UCYddcpHLmZArhRiq65UjnToc=;
        b=TzPVEnly4w7433N+kBZxcjV8Z9e3+tHJTYYvOHsqukb57mQzJrtbPndJcg2V6xxNcY
         WVofenQgTe0KcD2Ql+sm1W+J0Y+DC8o7uaZ5w9Avu+BsNwRCwqCNhCGV26JQHt8HGVEB
         t7ENL43nF6ngPVOdyDw2VOdoOwSyiwwE78ZtmUZjfr3sEVVDgjkB6V1xlLDE7UorHDtL
         j/A5stbJxlGyKwi8F9Qt3L+J70C1W/VscCJJhXxZnRg1VN8nqUqr+w9NM0OlR+IPd/v3
         /Rxqd9EfLi9KSkMu+r9mjVQhySGvxeperMpe8RzgO7vbp3Au5HwK1ozfnes7oEzICFuf
         DV5Q==
X-Gm-Message-State: AOJu0YxEPG09YlKNY18Q26mSPtS6KwlklWCYpAYQAJHe/JUL/cdoYFZ7
	K70n2tHmrwv/CN9P70cFluE=
X-Google-Smtp-Source: AGHT+IEd95KMby+FaKu8/bxssdUJwSuxQqijxRBzUkA6Qa5Imunn62jJCrDzhGREmY0J6EUzJfPCKg==
X-Received: by 2002:a05:6808:1411:b0:3bb:c599:e3ed with SMTP id w17-20020a056808141100b003bbc599e3edmr867056oiv.17.1704957696423;
        Wed, 10 Jan 2024 23:21:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:70e2:a0a5:5166:fbbf])
        by smtp.gmail.com with ESMTPSA id u2-20020a056a00098200b006d99056c4edsm464983pfg.187.2024.01.10.23.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 23:21:36 -0800 (PST)
Date: Wed, 10 Jan 2024 23:21:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Helge Deller <deller@gmx.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-input@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vt: remove superfluous CONFIG_HW_CONSOLE
Message-ID: <ZZ-W_WAmGuOU-Bbg@google.com>
References: <20240108134102.601-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108134102.601-1-lukas.bulwahn@gmail.com>

On Mon, Jan 08, 2024 at 02:41:02PM +0100, Lukas Bulwahn wrote:
> The config HW_CONSOLE is always identical to the config VT and is not
> visible in the kernel's build menuconfig. So, CONFIG_HW_CONSOLE is
> redundant.
> 
> Replace all references to CONFIG_HW_CONSOLE with CONFIG_VT and remove
> CONFIG_HW_CONSOLE.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> I think this patch is best picked up by Greg rather than splitting it
> in smaller pieces for m68k, amiga keyboard, fbdev etc.
> 
> Greg, if that is fine, could you pick this for the next merge window?
> 
> I was also considering to rename config VT_HW_CONSOLE_BINDING to
> VT_CONSOLE_BINDING, as the dependency is on VT, not HW_CONSOLE, but
> at the moment, that seemed more churn than value of clarification.
> 
>  arch/m68k/amiga/config.c        | 2 +-
>  drivers/input/keyboard/amikbd.c | 6 +++---

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
