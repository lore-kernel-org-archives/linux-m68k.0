Received: from server43.webgo24.de (server43.webgo24.de [185.30.32.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C410C20E016
	for <linux-m68k@vger.kernel.org>; Thu,  6 Mar 2025 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.30.32.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274673; cv=none; b=meTzpVtpKyYaNMq5mGOnRu8QDZVO0EtBVrHG1eknv1A4IyN1BP3aTkAlT8cnsb1ZD9Glj94163d6HwCfZ8qY6e5amlyXvZhSC/44Cq1zO7cU4c0gbJ9us3oswF3KoQoqWoBEp/LtaN7mEV+ruNU07nMhfY65Xmu6BjUBvWPMQbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274673; c=relaxed/simple;
	bh=xywbBYr2RDZOkBMMkGeXThx+HLaAY3izHNTtZvL4bPk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7k3l51GEZz2FF0bixxWsnxVRRBGwqc64eVlWrS68KB2DZ3MSkSg1yfvQz63C2BmAuw8U7Y1ZpMQR2Gno2YaSS6yoAntpzv7YpTuJYBotlj/7cc22JqHyw5kQUbSTsULGUW5dNu4P28xbIzX2bfsxuRr2oQXSYZT2IS3BzofxPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de; spf=pass smtp.mailfrom=tho-otto.de; dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b=vmv4Qm7M; arc=none smtp.client-ip=185.30.32.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tho-otto.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tho-otto.de header.i=@tho-otto.de header.b="vmv4Qm7M"
Received: from earendil.localnet (dynamic-093-133-148-172.93.133.pool.telefonica.de [93.133.148.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by server43.webgo24.de (Postfix) with ESMTPSA id 1774C4110E8F
	for <linux-m68k@vger.kernel.org>; Thu,  6 Mar 2025 16:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tho-otto.de; s=dkim;
	t=1741274661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLCDL82CE9PN7ggUJY+pa4SbjRGWzaCqPxC/Byj/QCI=;
	b=vmv4Qm7MY2BHpE3MM4sznFWt95LNuEETI5gILyuuSuUHG8SiaeZVpaPT1dIh+n2InPQX0I
	zU54Dnh5W8GyofURat7XGgg4/i6+0h1kLnnkO8kXmzV9ci1nidXiiFyvZ0RBHV7q9JaGBe
	9LDHebmupg7SIVhZyklAucVG0FZk9M8pv8l+BBfZLYo9rZ1f6WjQUB7eZs1dwGK1WH/rqT
	AnetRWNJ/Q+DyFjAVdnI6+UO8Ym2Ms5Eqv5/DmMPtA438Mg3DLJXWdShhtmsR6o+yamVCa
	DcCgvdYOfgmRuz8unURB2m+vOhDlLWp6WgVNNySpmofvoZJrnRaQF4F0avDUeQ==
From: Thorsten Otto <admin@tho-otto.de>
To: linux-m68k@vger.kernel.org
Subject: Re: Software FPU emulation in linux kernel
Date: Thu, 06 Mar 2025 16:24:10 +0100
Message-ID: <2773279.uZKlY2gecq@earendil>
In-Reply-To: <3374772.VqM8IeB0Os@earendil>
References: <3374772.VqM8IeB0Os@earendil>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

There are problems in fp_fsqrt when using the fp_one constant.

fp_one is declared as

static const struct fp_ext fp_one = {
	.exp = 0x3fff,
};

So, despite the comment, this is not normalized (the explicit bit is not set).
This will have the effect that it is changed to zero, when fp_dyadic_check is 
called in the entry of fp_add. So this call does not only have no effect, it 
will also modify the constant.

And even if that is changed, fp_add will also write to it:

https://github.com/torvalds/linux/blob/
848e076317446f9c663771ddec142d7c2eb4cb43/arch/m68k/math-emu/fp_arith.c#L90:

dest->lowmant = src->lowmant = 0;

And 2 lines later, the call to
fp_denormalize(src, diff);

will also modify the src argument.

Wouldn't that crash the kernel, if it tries to write to a write-protected 
section?




