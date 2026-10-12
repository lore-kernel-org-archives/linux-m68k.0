Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1EB443315
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790928; cv=none; b=m+08KQQF74FYlJO2ISRc0STCb3UZJl5nTwRfOLdBTKYDlasroe3YtziFsQThfN2qqz3Bn85OLPXZrRsxoon+Z4tnkeDWjePiswuQW/f5p19aS9VLrMRr/rjK6eOinXQpU0zmE2hfKe6vF2rDmAOVDglWfaLSgn+aVcmbUtrb3BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790928; c=relaxed/simple;
	bh=aPUTgR4ohijSrORKiVXQ1+7d4If0xTogdnYDLbq6R8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4xZI1nbSG9iJleY51Ua9PqCdq8SV0khxLYXVhDO+OfRqyvF/qg5h2VcMbcP483WZc157Ybqu4Zkcmk0GOEWLjdTvbg3PE+rDtduciP1cKRRKHCZyBydPhijlpsRASoUQ1kWOCtZnd8v+tT4P5GiD0dQdoVCS2coFTMS4CngG7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNDUDRBX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNDUDRBX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so6782725ad.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2026 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791790923; x=1792395723; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3hTlZHdoVna8F947+T+LJ1alplmfTzkxZyD3ZRoSRo=;
        b=lNDUDRBXEjPsBx1arfMJqKD7swNXsZlF15gW4aSGvaltX7dl0ZawoEZi8B0O4hZmjF
         SFqkmP+8n1Y/er5rjtD+h1HNdeh1nqwSSpjKwAqQ/NUpc0wOjPGWxnl3h9gs6O0xdGAk
         4Q+TTfNVco2Gom9Qjx8KSwjX/d9BoZ+Aq8vRtd3N1Rd8NOx0K5lN0fh+rHlkZT9xi0Dz
         GB8FilkX87ytQby3a4My8NhNZwAmHZo6efszMvnr0oeUmvQ4GAwEbWJzLFyVWuAzLw3w
         YBciWO1bGmJWr2kwUY1kYKkt5nO6LVD0T9kNSgAOsOreGu4Btifkuvac9lf6gQl0CjcK
         N3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790923; x=1792395723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3hTlZHdoVna8F947+T+LJ1alplmfTzkxZyD3ZRoSRo=;
        b=SpxSBXRO3n+pEVRCDMpT/BDb64+g+9EqJHe27pI0jKjdVw2RlP68zPjD4dL3TQ2pT9
         OVa7ssRe3bxFhiHbZz4H4EWdptsOpJEaL6cOyrI0I3wjFNtz1NWzfYJBMt8jMbow+tF3
         /vG64iwQQeVbqwqgqQz/9howYDzLiM2wFT0Nnq9qZ/pnL2rmlKVMykvyBgrDkyvIYa4m
         mxRs4/V2aetDnGF0PyncId4bI/F2TBpHTms4HL7ydPTbb/ahgxQGiihM2LU/PqEtmOQV
         5O4IjE08i8sceZBpk/++iE0r2LiCAH9guG7FbWfn70PLowumN28Q5NkDvtapt3QOuQ6o
         x56Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6dkncetcGTJfB5DGyRVFJRWgl3hUUc3ceK0HZ0cY2j2f8qby2K/5RcNb4ce5+3tvZFNWd7DA1FywV@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYJw7F+YVqkHmUq/VuHdJTP+LAg2EesCT5SEcyyzqt0DjDvCnaQI
	UKKoJK+KFVeOq61TaFFABKYpiUXQaGSwmxWqzv/6lvw7YfKyBZ+h5xfr
X-Gm-Gg: AYBFou0BIL/BbvKXCBirFDnUuwg76+ZTm/CWZPe1kBCaKuoOxOvELXgz5fn+JNBjUg3
	XtkphwHOIBR+rPyIg+7pbNrrMGoBan/ayGRSXLuBLEoyZqK3UD1ykuRsMoZFIg9aO5a5FQOQb1T
	XZ6pR9pmD1cO24RaXI3zuZljJkHSCqbuO39mxIRPTD6KsWo/zftmZl4bGJ+bqoZh27O23Fo3hra
	5H3U79aGt2YuqPbT1OFKPCMaHLX0GXmYvtc5yOZZzHJU/XmRNgIZIg2z+I2qw3tYMu1ZjStJKOg
	KF/Hd22uFNZjHXkSFIZUHlIcYc/OCPFbIz1gA+9+nfb3cNNeNIYWQdIgrq7jTOJeU+O79ETqT0s
	0aRHcjlis6Ixo+o/VKRQdtWwA1dpIBWbD8AiuEq3AUQGrzH7Zw1Oh/wyH5j0LNOhrghFdPIO9kw
	S73HnzfVv2/vmvUBj0ockKe/8VLewCRIy+uHQ5oXYsJsZAnK8QMPeO0b6eILk+b+hXCDyZ3k1Fw
	R+tq8gjrt88WpCkc7yKX5rqs6M8W3UaBPzK36/Dedg=
X-Received: by 2002:a17:903:22ce:b0:2e5:cf8c:633d with SMTP id d9443c01a7336-2e842bc1a5amr77384385ad.34.1791790922951;
        Mon, 12 Oct 2026 00:42:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2039:4:e606:5ed:c4a9:1328])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b160csm40079485ad.37.2026.10.12.00.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:42:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:41:58 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org, tglx@kernel.org, miodrag.dinic@mips.com
Cc: radu@rendec.net, zewenchen@google.com, jamiechen@google.com,
	edwardwchen@google.com, marscheng@google.com, eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 0/6] m68k: virt: Switch to generic goldfish PIC driver
Message-ID: <asyPRtp_6AXHhB-_@google.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>

On Tue, Sep 08, 2026 at 09:40:10AM +0000, Kuan-Wei Chiu wrote:
> Convert the m68k virt machine to use the generic goldfish PIC irqchip
> driver instead of maintaining a duplicate, platform-specific interrupt
> controller implementation in arch/m68k/virt/.
> 
> The whole patchset is tested on  qemu-system-m68k -M virt and verified
> that interrupts across multiple goldfish PIC instances fire and
> increment properly in /proc/interrupts.

It seems Miodrag's email bounced, so I guess I'll need to look for
others to help review this patchset.

+Cc Laurent Vivier since he wrote the initial m68k virt machine code.

Regards,
Kuan-Wei
