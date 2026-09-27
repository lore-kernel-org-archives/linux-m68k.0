Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519DB3C0624
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790501343; cv=none; b=QwQEPDFdelNrv9px9ObVDMtDydPrzGPCYr/LCvhAPjKZWIOvvTaKV8aB9W9PEJX50/Rq/ejEpY+FTBUzjeS+eC2PPSmZ7/3uik5DNnRaMUAi6NnlOpizKl9P3P7Qzm/4zIRKnyPYsYgJri+oQcicMXv0OV7PEV0ACnMl37vRlv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790501343; c=relaxed/simple;
	bh=4x8l5gtCNjd3MzbigudBvHHGyNlD8SUXdmY1T/ORuAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OY7SaRqX0S2mlziXzYMgJKG8iPU7GJrVzzqecny+uGO9P4AC1QcnmEibcGoCk6Gk7be3KYjH81sYf7lJs2TvmF1Xk5eurkPsu3RlgmVBK3QsFDDBdLW9RelQjYbeLQw8llyECSuL4aL58uu8TERFDKDHeNwv67HEnkOr1dht+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so1255487241.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 02:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790501340; x=1791106140;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=csdD6jxORMZoat82NKXRRvNrkjCWmWkfxNOA751RjhY=;
        b=ZNjdRUETEFJ5UGkYea6p3Yt6fLgj+Ec1Z9gGQCkAfwxOO6MdKxdHxoNWD81RJA2BSm
         fEyGIiHTXdHRacoO8z75At7UrY0VuLtaoO2gF9/xRKLhhJ941eNk/Xo3egOxGP8BhgjT
         2Fs5lfi7YASypStve1Yfcj7P57NpZoAsOz6byJxvwjLj/0Mg0HAQ7/SMcyOtO3Dy4OTG
         +hISy8noi3V43JlQ+kKkOOTsB35eN1asn6wO85POOT+g3mG3s3VksBsRpzF1DtaMfhI+
         2Io55FI8WOQPuWr15GM6t7IkMnGIZwCOVrmgyAbuNeevnFFaNXLB3c+RFnCfjPY3Vkqz
         4b9w==
X-Forwarded-Encrypted: i=1; AKwUvBxVlPoQKU7X6GAypVqJK6ohpLDlBSTGdvbdjRFb2uM+ML6USFp53EU/IFNN1O4c+elhPtxN9s99rL0+@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYKqxXPNNljHptaM5IvsONyVV9XNPpbr3uNEecFp30ga4/m3dK4+
	fyTVtlcxdg2Fwj345S3XQUe4aCFk4v6o390veS6yE8pbxpesfsw87cfkq/0xjoT9
X-Gm-Gg: AYBFou0Nq00u0+XsY945k8dW4R22aorRF7YqiDKukU6GTKJYmLt9EFVkqEws6Gaxy4W
	WZYhNU/0aFdeH9bC46FfL/a1/PT23Ju+rPLuTJgdqBJK1pK7TVwnyGxTZQP8NkQKSlUEUX0LSka
	rA7CNrN2lQmQS9LJR95hOIqKCJa7gYFoDADXnSUDJfmpI1BXqwR2en+E82cLgy8clSevbMRV42c
	z0msJxQVTKTeI5IxJ2EA6x7UWeGCund9KxOyB/diXCi2I10cmnSKapHEn8LHVxNIoa6PhdMVArU
	YhHxdIXUF/bvw4L6yQHBiHjFbXsean0lG+71lpu3ZOZEhmR2/ye2eL5McfjlD/oUMck4wrKb66S
	fffJfoGwxtMe9+dtS+IED581rgADxmXPpzRquvABaR0q6gGcVr43A243zUn41yGCAnxYehK55pj
	xw4BZkg+dC+JIShMqWXn9kJDlJCYBMrqJMcXEz01BuxD7T46aRgNrx++IHk/73YP+L3YmECyHHK
	l5AUQliCId8JMYXK38J06df9OmSg3ha4gRgalPXYxzE57c0
X-Received: by 2002:a05:6102:8096:b0:7a1:f7d2:e81a with SMTP id ada2fe7eead31-7af1e6ef2f8mr3961444137.19.1790501339996;
        Sun, 27 Sep 2026 02:28:59 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde5d68034sm4764830e0c.11.2026.09.27.02.28.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 02:28:59 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so1202148241.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 02:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxsq6vM5lLKCluMKbaHksTobOqhEHIrmcr8tLCFIm3oDMuhbvm74mXjMf+MnZgYJ2K+G6GDLkkuCMhG@lists.linux-m68k.org
X-Received: by 2002:a05:6102:2d04:b0:7a1:f7d2:e824 with SMTP id
 ada2fe7eead31-7af1edec5famr4750030137.29.1790501339370; Sun, 27 Sep 2026
 02:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918141926.3023230-1-peng.fan@oss.nxp.com>
In-Reply-To: <20260918141926.3023230-1-peng.fan@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 11:28:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMrBStfd8QAi4U2iZ99y=mDJOUhB58XJ9yaz0v8r4bKw@mail.gmail.com>
X-Gm-Features: AclHuK_FNakOvnI35QAAk4owW-nxtMw0s1-lNczNFg7HJNVICSo26yhinb-7UTo
Message-ID: <CAMuHMdWMrBStfd8QAi4U2iZ99y=mDJOUhB58XJ9yaz0v8r4bKw@mail.gmail.com>
Subject: Re: [PATCH] zorro: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sept 2026 at 16:21, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
