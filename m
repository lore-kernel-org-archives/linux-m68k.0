Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795483770;
	b=dp0qNKOUVImI8hEUVML4VAK6mGE7HNG5ZwaqLTUk3WoXfq/G5iH7mKNv5G2j36wSrKKk
	 eiBwrXai6PlLyx+8BbKxea/xVDM8NpZbmLUDvLZmWpWxHOIT3+CkEtXLKYK+bYwbAoX0h
	 xWDZpPTyS+W5cxH+WBZcmMkwXZO8T3+GBGF0ehYOyzjlxI3PV6kOR/1fFjdUgkNS0XZKv
	 oN4hETYuiIZhhIgFQ+6ZmfUfr6n40v+OlcNWFntT7HEtP3HwWZeHPli7/Q4L/KC2tBQiP
	 MxobjxExrHspqlSStv6dyBgY151ZqlwiEO7/drt342anMTciJT0q4SlWcc+kdl/VMgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
	b=Nic9Nq81jd/J1yXMHM1pF4oPi+b8UpVLH9MFbLn/uvwUGzkPgCe8ir7NGhB7J9YPYp5M
	 0+pd5UW/ZcLVcayLw+bvL4Gq/XTIOXfDAi+/p2BMYAezE16YvlYFHMIxIFQJ6Ek5bwq+a
	 BNZO4oxH9/Lu4sb9HUthSG132W8AsPHktmZ4YGgJN1xoHI2UlmXBAUYReAvtr5f26EMbI
	 iw89GrouXHtLUnSwjyW+3kZGQHbaHo0rEODDQjC6PQqRXOd2ctWb39lXVCBxGyTVP1dfv
	 l4Z1h8jfEWeQf0PAZ1S8fbVjRWWImDUZ7cMhdbkLeSedQNwxpRUxb6h2IZcV4jMAQRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Oi5Dcqr7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C0606A321
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 01:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=Oi5Dcqr7
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18818daa3e7so2326593c88.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Nov 2026 17:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795483769; cv=none;
        d=google.com; s=arc-20260327;
        b=LEeO9nbgkasZza210NeUu/4456wm7mTlGt8kI1HsjdF/XIcwxr7aluCxITLTUUHCG4
         9FqaJsZygALqKxrtAYcOnfxDBKwkYdQ+lA1oO2pCoLj48KCwnXGcXE4G+PelKX/CFZgx
         YPHAXiCxNEdMZnTh4MILZN/MRXE9A7bZdhd8PKw4yBFxA35Lw83SRzT+0aw9WCWg7gnO
         C2f7XvoyZsFgwCnHnvVz18FVpkoXS0VWvjPSbTDEztVVdMvdewGOEiUFCKFZoO3THhSG
         I11WnupbFHprRU/k8imRIcmyErnpycvY0u2Wkvi7QYrDd6hadFGcqhvHlGlvTp0ddAq1
         2QAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
        fh=1xN/tkodxFWfedxIjcqsXOG+dDc9ORyc3CS8XXLzc3Y=;
        b=qiNIRBzik4Saoea3zDXjvW679Mz9TZca0A1xo4CDVUo/AGBL2go4VtB540Lw1mHzCS
         K4i73utd7ziP/FXqvoccwn52uHC/H5eFLZTm7aXO0QLI2JIU20e4FENJNe4wFtML8eJf
         GStzwMHNEMUeb1NUOtsMy4PL8nil1fhhNHJuXRy9Csx4mOgnwnoYEgeK1CR7Q4NLJoae
         QjV433pVkBOiN7W6R1OjLDm5QkjsOMIZZ+GPeR84xEf5vNlHDVXMlciljOElBevvDvxE
         3IewOw1gFJHNKcmh5hktLXEfvVVZZiFEhLF0qKmr6AbfUlhII0I8yrOUzf2HfRQKCrnl
         bPcw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795483769; x=1796088569; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
        b=Oi5Dcqr7MrMBjAk6j0UjuNyodxk3e3EO89fOVu3gwuem3Im6rzErKPk2yyvublPxz3
         UcvISrPJS6rR4GAGopQzxp5EKPmWmmwz1RL3JIbTZp+XekrwoeKUlvkysA8Q1uAlg/65
         uE9Hhba+y1U34cT333XSUTYi7zKnQ0eXv1lUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483769; x=1796088569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
        b=OQ9apLJfEEpJtlHSVHU+H6kwwYu6hqdMeXYwyw47GvvAweNzqfiruEGBuq7mtpsVli
         E3QqQJCy5OKMI1uAeJiz6TQrdhsqqCVpLwa+SUY3ddvSQIDJiG/rKr1KKtZ8Y+YfpnS6
         bsCeOrI+g5Rg6e1UnDMOu4i3CRLYeDVPoEy4L6//RIl5dsdpdGri/cLc3TPoFBo2Pzll
         bmneV/yqnKdJ7xJvL0MU3W375rptV8vRCR+dGh03N/DtwSsDvlICGL2S6xQz2c1GH+5e
         jpG58F04+v5BsCJyNLsQnkFQ9Uw1Hcd2CVbi0EuwGNa4pBOLpbdE8qOUsacJDH/wmD2C
         ijAQ==
X-Forwarded-Encrypted: i=1; AL+hErHowbrcC4b4JYKQRsdKUid83Txqjz77xOwj1OjjVuVWUCQ0RUPvVEQDgd9qvyTzQ9+C2HV1jE5Mu9kW@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+tRP5fq1KheZaw4ACsm3ZgvJNC+ZwM2vRTarVIdNJo7dT7Lr86
	6Oievjz2To7O+eT7ny1hiYxMhHxrXe91i5eXAlqB4magfOFLTYbnXiSeLkw/M2IdBexfB0pwgQu
	pnuQHht/uA5OUC8wnN65NRxZIc/i18tdB/HcV2YIZEA==
X-Gm-Gg: AZFdTZez3Aw6KNqATBhm5jwdrK6Dzt2ClLF5NDpXIofUOmc4Xlw3OaooEzJy9KpI+qt
	jby1/DBheY4qzddfSUhn03tUvzvL5zGYJS0yoaAO/u5mm9eg0Bh1mM/ABbHwhiKI2TOr51RxR0J
	rhXjk021heWGNl9LBUgM3VEbr1x8zGMQak8ya1ZKDIyf2G/CFkM8688GVtkYbPimzS2tCvxJWdq
	lo3qbaP1kEYjFk+d7crx5IyhYt9N785IHvd1j1spm3KiFhKMlOSEGPN7AIOSOsKIdNWcOz/jcIH
	2vgLzJRoqTxmmWmTqbhteRx/SLenICuWo/DIuLWQOvi26vxV611CdDyCm34tgF/ec31zWjVocja
	uaqVt9mn3GHlck+fPslsatGIDAN78hcXewSPwG1I=
X-Received: by 2002:a05:7022:296:10b0:1b4:facd:5311 with SMTP id
 a92af1059eb24-1b5524972dbmr13211449c88.8.1795483769303; Mon, 23 Nov 2026
 17:29:29 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
 <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
In-Reply-To: <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 24 Nov 2026 10:29:18 +0900
X-Gm-Features: Aa3M54o0JiYTAKqcLTrNwkwS1oQokR6HA4PVFm038Kc9FIiT1C8aDz7TJNtKvgc
Message-ID: <CAFr9PXmgpbX9SB6BuD_VdaD7AuU_ems+RRpS7AegvGpaMR9Ctg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Preserve fixups during dead code elimination
To: czietz@gmx.net
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Mon, 16 Nov 2026 at 08:27, Daniel Palmer <daniel@0x0f.com> wrote:

> That's mine. I wonder if this explains why one of my m68k machines
> would not boot with dead code elimination enabled. I forget which it
> was now :)

Tested on Amiga 4000 (060), MVME147 (030) and E17 (out of tree SMP 040
:)). Amiga apparently needs the fix to boot correctly.
The reduction in kernel size is ~8% for all of them.

So,

Tested-by: Daniel Palmer <daniel@thingy.jp>
