Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B6A361675
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791216; cv=pass; b=Tfctz2a7aIrkYbpJylf5tgT8XnGWQlOiDnp4/LlXP0q6d9+KQbmV9NdWB9zWzAzeqN9YyIsddW/07IhNx41yQb8LGo1VIaNSP3itQsxf+Dpro28rkPetc6UEZ6gm+7T3PXcQ3uG1t5igwylaeF92lKpVHlvfo2a1k5ivi9Pq9Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791216; c=relaxed/simple;
	bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWOV0E1COM6fadOrwICeFhAWLzeSjv3HY4t8BtFaRHvtPmz5Kgtlp2yt6SbdhLb6ft3Gbf+B/jEIllM6olZfGcWCw+nGs7GqKoTlR0KzjN+SsrTLq9bjSwPuEMtGa0cwkVD1uOcLtCaE3X0VUjT6AvCa+WohAdbYBI+k1WbrQ2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=CP/UdEse; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="CP/UdEse"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0a921ee46so2468737b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2026 00:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791791213; cv=none;
        d=google.com; s=arc-20260327;
        b=gMVR9HLos4LgoE9WR5R4ioZYVMiSXMXzYHTT9EWbdIsrCOrXoAeBWi+yEW56kI/w4D
         o8G2Ykyhcb7k1Q2Iu9K/EcKB0F0U0yq3gVs25srpEmkiETwf4B/skSEiDwCDQMWgkvqn
         qTTzZXfNdgOIGRlbeFvSwnFeXMVpKY6LCgzYkrA2qvHpH5I03LC81suxMd7f/4GkT0Ng
         hsWHmdsIgbljSPvWBWWjrejbW2jKOqx1n0dNS2UOL9uag+dKw3FAS2HduYI7XYXAmBIJ
         +V26GlNoTkvJdT+0kfKxyth5WvM5Y/fhKY+6ZLwYB+TwUBDCQiCGb+lST3Dw7SDBfd2V
         uktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
        fh=MEUUWi56+3qXPdp1uzbbUSgMxdH2Z6/xP0WFFPoBSCg=;
        b=THTM9QSptIoKkVSXurPTsaZbPdUs8JMloGMM2B6KZJkmTPjjAY+MAKX6a9cTOcSBdY
         mee11Yluffp9ZqEyZaM6cy+BFrT7CF7mciUL/vzQ3NExsPd4xnSnPZhOQjMpaGA2YxYG
         tI4LS4tMCDfhQhhI5fNAhBHsdCPZ6zYAFTn3Q7Sqv8BS+O12oJrat49RjiTNq7ITAOaK
         1+DlqcQTzZTVSaiTxhHZkhxl6T1pGwaFRJdYhzjUmhPC1LLf2fx+9leCmmoX4or9BkUB
         1U6mi//h5lc734pS/s+PkBnw0E2WIcrzcK2onflu5wOOkefvwKR/iLFZqStHKVTkbbea
         LqVg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1791791213; x=1792396013; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
        b=CP/UdEseGq7qA8/3AgdIUti4UUlQqoSJn+YOubR6P8/3e0fuaarDLWGWWkJKY5oho/
         TCiVBvU1joJu+vpSbkOQEn8hS0vv9NSgAfAjyWR1rkb+M9eYwEZb5h8sH2nstJy89Vfm
         uGjeCGLk6TxkT7hsznQPflKmz+XaSAfj8HYNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791213; x=1792396013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0L3A1MRqwT1e92DARNfm0cf/Eg883aHSpIjyUoUgf4=;
        b=lReWLbAgZhFq6wd3lxLv1+dyR2ENgs3oHmdh6Ry1OokqvyYR3ZKsKCO7n++BzRD0mX
         OVi5Lb1xyFcbOBW+una5jT7gRP1YzVmZTbj/mCQVK9wIr7+z31v5ggjaUiCgA7dmjsFL
         fFkGyHIw1B0oNtkstzX7bn2rpFxNs57bGKlNIjDqo3j2jbwUHbkZrNXYQviZdX4UIx21
         0m6demN61dvr9zxJwairA2XLXF4G+cY5O0xuae4Gq5TkbrKpYpJpD+mhZVXCxexF956F
         pc7F42HiJkD8onF8d+fHgpXMAzYKPyLQkaAlS/0nDqc/SK1H8UbdkodIW07Xw7TF3sU+
         OjSg==
X-Forwarded-Encrypted: i=1; AKwUvBxHprZpCes7J4+RaQcnQcERlZF/bjY5wby/QWmRy3oS67KP/YrwoMmhEGjYyhxFETGGJyrHb5nR32hW@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYLrZfxKNglFjx2KJhHBgdeMmyaDgH07AqGAGcq3Qbh1rswfv1Iv
	2ZW/OwjahPFKaMEccFTNgZe/l9yKRDxcI7JMuDDwG6J9vU2VX59xqZRkh4kYJAYhmfLrXlJWcb9
	/RqCEB8InnHDYzLg3xcXAEwZD2RdPVRllz63TYCe10w==
X-Gm-Gg: AYBFou25f/LWWo4CGU2DhpsI4hGy0GeiQagnLKbllURQYELELOAtKC6pWFPY+nP/HCD
	m9tUFXl32iIxZSms4hnL1mEC3iJCJX6Lg4oJYI9KIsLvrRoxU3Lu+5D1l8RaCA6CPuXB9+yIp2w
	BS89m2g28T9otT5pYu0OmtH/id1K3vS/XGOM8K61523DQTywek8RbhXGXyvfYSd0xY2rfNxRMi4
	DxTd9RnKelWUo/IBuW+OmHQCBjhq2h2H1l5Bhtl5DMMiT5OVIYMLcLF5iAB1N38C7DdyY43F9Qb
	Qw2MahG8jx1kyPRoamkj/JTz+FMfr4ikceai9Rd2Dpr8yth67yk8/WYk
X-Received: by 2002:a05:690c:580c:b0:8ae:1a87:cb03 with SMTP id
 00721157ae682-8b07ec01440mr20948907b3.16.1791791213159; Mon, 12 Oct 2026
 00:46:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908094016.1997918-1-visitorckw@gmail.com> <asyPRtp_6AXHhB-_@google.com>
In-Reply-To: <asyPRtp_6AXHhB-_@google.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 12 Oct 2026 16:46:41 +0900
X-Gm-Features: AclHuK_wv0S7JAvE7gn6Av1ZwK-aND01tCCb14lS-XSMWIDuQ216xDlDYD3DVjI
Message-ID: <CAFr9PXmrugbSh3hweHV1YYXSNYMM4QEg0gPs6tEsJ8Z7Y721sg@mail.gmail.com>
Subject: Re: [PATCH 0/6] m68k: virt: Switch to generic goldfish PIC driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: geert@linux-m68k.org, tglx@kernel.org, miodrag.dinic@mips.com, 
	radu@rendec.net, zewenchen@google.com, jamiechen@google.com, 
	edwardwchen@google.com, marscheng@google.com, eleanor15x@gmail.com, 
	jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Mon, 12 Oct 2026 at 16:43, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> It seems Miodrag's email bounced, so I guess I'll need to look for
> others to help review this patchset.

FWIW, I have a version of this in my devicetree'd nommu m68k setup I think.
When I get some time I will pull in your version and test it out.

Cheers,

Daniel
