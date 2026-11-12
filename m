Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456840;
	b=aJUgTqe01t/uFiRDhiIVIqkfRlb4zh2xTiHA1Ll6g/ctjDfDtI0qicsM7mJwFe1Sz7di
	 0G9vxfslgHY9dKdljTsnxx2t/4PW2G+4scWX974q6qTYHNgSyzxlIaYXmqwgFFcUdYP9w
	 GHksrXgG3y6Ev01BSKF8kVwpDm0oTcmPY3jctp8kZdfHn1oRB0VkpIW1WsXd+QEnr2Mhn
	 nb/lqfhHhananWgeF5uEOxzpE6vQui8dnsQGzJFlPsFzgnWc5ELsIrzPinqFdfYLHqWUT
	 5tMUguD1mvHZZr27wX7lsCp5Xkq0qwV0NnI5OCRhbfeT5yS1djZOqjnn7gGdDN1l/QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456840;
	h=DMARC-Filter:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UBnJEnj2MLEvcLRTvWDNC7MDWlj8p0TTPWPE5S8u0Ms=;
	b=Y9JX3xQattweYt/UOKNFEumjI7Vs9cI3G1hLPMtzyjEKpAe1D20/EByfHvQXb8gI8n8v
	 TT9mW5qG+ACnCh2MPHQ2G/Ktix1Et9NX8v5HbzKciuOc1abg4OOOz1MAtQLEBZHXAOkzW
	 bWpNek/cgKlD9xNoQNVb+uAH5FF2XbEM64/as8T8nlu63nld5ERxvbbYkVw+AuxEVFtn5
	 tXGzq4fDcUv9+rHKFOnucuB+DoLxgPWDZyQjyCPMvRS3mJOgSFSiLrK/RCuuIZ2n7vqTx
	 Cd8S1JO8+2cLuKtodOB2cKUiFiMSViq+SVA0pStYqfcSQEIEFfhrQDO2KFnqZC86m0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SZDky/Ne";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109C7606A31C
	for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Nov 2026 04:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZDky/Ne
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB3FD448CE;
	Thu, 12 Nov 2026 04:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4880C1F00A05;
	Thu, 12 Nov 2026 04:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794456839;
	bh=UBnJEnj2MLEvcLRTvWDNC7MDWlj8p0TTPWPE5S8u0Ms=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SZDky/NeDPlMtdVniTAVj3noRx4JxxuTJZXqFpC/aQVZ6pMZ5Bry1fDoEeuSHWnsy
	 loiv0zMCwOkxvSX9eWKC8McaJ4a3Xc1NSkqmLFjJKX5mm4ihsjf00jIWhe4luDhLtj
	 D0un6s9m0PXhjnBuLtROTD2X8FVcLdrh1VXna538pQLedmjXPG8PFHxsLSZtAVKRAk
	 Mz0DbMft964A47+cezL1AHkJi2khM6Jy/k9Cw8PAvWVmWDWoLGHRP5hWcHEvGxj/Oi
	 Fd371kU9Bm6ckePJ4HzdLNZV4NnTkmjCJWmCUzNvLTLFQFdXvOx+Q0D5IeWMsQk3o+
	 eZtnFyDLCHw2A==
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 03/11] modpost: cache section relocation mismatch
 state
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
In-Reply-To: <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Date: Wed, 11 Nov 2026 21:13:34 -0700
Message-Id: <179445681470.2545603.4522535241002496455.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=507; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ESrYONCK7mPGykLSGsAgCNxT8WO1N8h1fu0MOtiXa8Q=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfbT79UvRYb39r0s4QmR+WFuLKmRbcjcLxp25P+Oa9/
 +a1TD7jjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRgmpGhunzMn5OzP6qvEOh
 Wbz4jdGfffMWvf7d96K6Y0HHoc0bJz9hZLj6fuNkHXvvJzxyBsUevSb7m8/8vO5fav+04/S+hA/
 Vz1gB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 04 Nov 2026 18:20:21 +0000, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> For every relocation modpost invokes check_section_mismatch() to determine
> whether there is any kind of mismatch between the source and destination,
> and if so which classification applies.
> 
> Each time it does this it invokes section_mismatch() which iterates
> through the sectioncheck[] array every time it's called.
> 
> [...]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

