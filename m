Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECC3F8709
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723347; cv=none; b=bWEplu7fA/HDJZmZPqgxf/9BS9VB0gn84TYjWPTCuQClvzj5x4xe4ukFvLX9e/Wne/i8Kes7b3pVX0K0cTrgp8l0vH75qRxPcBWL/SChgRKp+FwTeyf8DJSqfn1Snd5haSfqEtRDbXs5Itsa74KFag8Hlf6JO3Na7lLwVZIr09Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723347; c=relaxed/simple;
	bh=/ifxBsG/leb631xMulkx/J8+Hl2OxHrpm4ozKGpTTUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfaeMjf9UGavOUc/Nd87MkPTeWN6wxcdSPSFQhoLtCrLd4o5Q+0r+vX+3EXio+Vv9n+cQDLzmFOdgwtZ/9+ox7MW8k45MhacYJKVa2JW5JXujwLDj0UII5hI/719AxryjOWJAoJpfJZVLelbykGE5TQBiVD6JcBBA9snA0UFKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I5gz1ZBN; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I5gz1ZBN"
Date: Mon, 29 Jun 2026 10:55:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782723327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNlz5QdGAFmc11ruQQGGkQJUKoaOG3OO0MGF9N+JsKw=;
	b=I5gz1ZBNJTJDPbA0LILsq4JdoFro2CSV0OcQA3abjOfbd3xX1x7/dbM14Tz38NGhKUQ3mo
	V0QL5uqA1M6SfEfdrfCDVgL5me1v34TknxXX4x+PE1rFqW5z130CQ4yopo5jIGMN0Hzorx
	IcESxQJAJdKWLZpsHyO3ywooo9Rkt8I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] m68k: amiga: Mark amiga_reset() as __noreturn
Message-ID: <akIy-8N9QAOI53KN@linux.dev>
References: <20260626145731.64010-2-thorsten.blum@linux.dev>
 <CAMuHMdVMkDOK6baAm9cjYyuUCOWxu_OHE8+ftNwEU1rFfet7Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVMkDOK6baAm9cjYyuUCOWxu_OHE8+ftNwEU1rFfet7Ag@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Jun 29, 2026 at 09:25:48AM +0200, Geert Uytterhoeven wrote:
> Hi Thorsten,
> 
> Thanks for your patch!
> 
> On Fri, 26 Jun 2026 at 16:58, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> > [PATCH v2] m68k: amiga: Mark amiga_reset() as __noreturn
> 
> This is not what this patch does, as amiga_reset() is already marked
> __noreturn.

I assumed __noreturn on the second prototype would be ignored, but it is
in fact additive.

> > Mark both the forward declaration and the function definition as
> > __noreturn, and remove the redundant redeclaration.
> 
> Why both? No other static function (except for xen_pv_play_dead)
> is tagged __noreturn in both the forward declaration and the
> implementation.

Can I blame the heat wave?

I'll send a v3 later.

Thanks,
Thorsten
