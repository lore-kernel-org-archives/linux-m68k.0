Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930393321C8
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jan 2026 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426480; cv=none; b=KrxKlwwtvUkSm9y9ddXcWp5SuRjFo86+e79ESx59m9UZycyO4VNSH+2McHv4lzB80aDZ3Kib5Wnf2NTY+qFrRnMZX9T9axNIO5Ko9uxNHcvD8WktYdISXU9P7RiaCXaB4wgjuNkdQZYxP7nqupuN1i/ITzSqKwcvQ3aW3rFPTAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426480; c=relaxed/simple;
	bh=tGe6v+UkH+nHY5twHVV5nC6gW7A4kVDGuAPzVtQWS64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4TRwUkktOV61/PT6EnqFebk9YHAvP9u5bVUPSIuNVTYw/DioOc6ABCnuRj7zqCieXFEU9664Wj0bijrcs93GOSn6GtzygQsmCaAuEVYwSpKb5nEEEddbj48f93epXDQ/f7ljT8FUCwKlg9721fdPBjIftIhdB6ot5BLJveWKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56376c3e866so4275463e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jan 2026 03:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426478; x=1770031278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNw7CNlxTDDFOwZp5WHCg23lMNI0FBRvOqG/wK9y0lM=;
        b=dsMPcYrwKZliX3px+PiTa02Wuipe9I/P1q+mABDdIygsqt197fIh0bUYYjO3nqJRbZ
         dqRzQ3+rEd3zSLqnmdG4vMJJR1kmvq18aNkS1UcQRr/FgA3h78Vim0sCwoVPltCReTu9
         sjpbifstVVhuwRLR9GsjzzZaWjBEbUF+d+/gshPKVTZQbQ56kLHTmJFAmRrKFzC6g5vU
         S0D5/cF7b78iioYeLvagzsulbcQ1KzWAzKSq9x515Zi/V0DHdRyxWSNF91N4O+n9GGDM
         lK9oWcnae6jMAoKanp2i3bg6cO8CLKYXOaR37eqIN559ibNg+E/nLDHtyqiUHiLIzu6W
         bjSA==
X-Forwarded-Encrypted: i=1; AJvYcCWouPMmwMqwzCtZgeSE6bXHLD+dzqT0ZinLJ1L8wGtsAs4UDdk6org3Gpr9UZVRjb1lwNRijUeZpefd@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YysmyhigCiw8HZmC7/s1FbO5a6VL8WExIy5w4GpgppVc4V8HwD+
	6xb/miWjzijSq8L1dGGfJazbn+a19I5S74uX6WxAuSTE80v/JOmk54cpx5R7A3Tv
X-Gm-Gg: AZuq6aIAxMUp6M5m5Ff9PjJNOEpWzUTt/hd5eXRb/Yk/E6PMZVn1rSt6JMnk+iQ6Kte
	0k+a8ruz2lXV40kQxNENg1aD0GaDMET/6rfwrbiCjRyfQzu1T7i4ln8paVpbgqHzbyn4ZOkdNLS
	aCCNGgxxwZSvtDCSS7xVOzZUBkq0iUnVe6wnQoXL7NcAyKQqSf210bG6QY/Q1VurkedN6TCcPGd
	p2kroVdobVI0fQcj3i8KGbYDS9Kl8lSnL8G5iVoKP9yXO7buuBTsrgP+7nVu7jYsYmpr36cE6UN
	AYBHV/XLDJtHVjz7gJA8E+jLSII0PBMOuC+DWPxEoe7sP0cgJGvHxJBcs2LV4uZFmeq3ceEkLyQ
	mhm3uuRgzZqTCGu8Yfa8Cs4MNCj6H0iAlX9XJTOTD2jN+HY0lYxBSNhe+QO1vsaSeFVyoWsLIHQ
	sbjPl75S6091Pc2I57B+gHmwa1X4NpdurpLanS8lS4sew5scEY9XFI
X-Received: by 2002:a05:6122:3a10:b0:563:60ce:9d53 with SMTP id 71dfb90a1353d-5665c966b10mr1259282e0c.9.1769426478410;
        Mon, 26 Jan 2026 03:21:18 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7dab9sm1690798e0c.15.2026.01.26.03.21.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:21:18 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-559f4801609so2003918e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jan 2026 03:21:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIACkkjq9t2o8SG+FMjbvAvoUILX9YgFhfWUpWXkDxjTDaM8cGjARQAstDjYGPRN9IxJcmq2xHOXQ6@lists.linux-m68k.org
X-Received: by 2002:a05:6122:210f:b0:557:b52a:d553 with SMTP id
 71dfb90a1353d-5665c964819mr995056e0c.7.1769426477829; Mon, 26 Jan 2026
 03:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <478d5f080d74b6688c9e3f9132e3fe251e997ad7.1765610469.git.fthain@linux-m68k.org>
In-Reply-To: <478d5f080d74b6688c9e3f9132e3fe251e997ad7.1765610469.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 12:21:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWb41i2mCU0Ob7pDaL1zJVgpJtXKFCWCf+XsoigF3OSag@mail.gmail.com>
X-Gm-Features: AZwV_QgdN7GdXnYk_jOAiRhvvo41YA3lGsW8i9wVIt6VjDJZBCNjYXvvvYWdtqo
Message-ID: <CAMuHMdWb41i2mCU0Ob7pDaL1zJVgpJtXKFCWCf+XsoigF3OSag@mail.gmail.com>
Subject: Re: [PATCH] nubus: Call put_device() in bus initialization error path
To: Finn Thain <fthain@linux-m68k.org>
Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, Daniel Palmer <daniel@0x0f.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Dec 2025 at 08:21, Finn Thain <fthain@linux-m68k.org> wrote:
> The error path for bus initialization is missing a call to put_device().
> Add that call. This error path will probably never actually execute, but
> any kernel source code may be subject to static checking or re-use.
>
> Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Suggested-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
