Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAB7D51A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Jan 2024 05:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420365; cv=none; b=jhF6AWXhMLtQNgubRe5PTnQ/IjNyWqo6iO4gd9xdHazIFS8Vs/857ond+JMZ6qu1n0AK4Nz/CcfVPGz0Y6lCJQ8QoRNVROJmRrG9u4nnscen8YbMZKZTmpKKh4m57FRjaKye1Mxlf/F62UNln2/4DzTmynCg/9amlaTiIwNyg9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420365; c=relaxed/simple;
	bh=ACKTKOuJWUOirQ98WBHpdV1H/YZfxrXRPTERjk4FaYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kEUZ+kMpLTKybkStOby1rJOuxJY79OGYBhOtKL3OSGBGCPQ4Qa0gs85QpUj5Nj+0dSqsGlHhzdkUC9OwVpGym9nvM14IKEpq5vs+u8DTZV7d/9ajsmDCgyIJw4YlqbtKCSahGpJPCYlmjUCILtycF5pV5RXSCaxNn1xn5TSzpgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QGIBCckh; arc=none smtp.client-ip=64.147.123.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QGIBCckh"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 0443F32004CE;
	Sun, 28 Jan 2024 00:39:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sun, 28 Jan 2024 00:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706420359; x=1706506759; bh=/tykfuzP/yR2RGWwFOx8HgWGqcUI
	yxkAtWGbaAySd0o=; b=QGIBCckh5pOYqdjAwRDpZ5oAxbCS1/KBe2w3cEpypgWA
	CDMJDnnDumnw9Mpknp92wKit1tdkTEnN7cXRdtTYHDM3ssaigpx90XRr9hRub+FJ
	QL4yDoP2uM2xtF0MNfGPQO1QuljgMUSEHFM3O4KIccPPg07SirFI9DpdKzlvgDRJ
	cX1onb86SbT9miZaZKSYNrCS2flEEwxVXb9x63zuA8agwsoUhFVSPXxJ2S2JrvYi
	bx68MHms7RG//VDiNryn5MhaYhpaOs/eEokgUK/PHBDgPx+fabQzDzn2cPzbNMZL
	wy121y6ijwYVVzAgsnE/WOcIKRC21Q+iSx0KUiB9gg==
X-ME-Sender: <xms:hui1Zf_xlyl9BjJ4ir9hFoSVgAtZLBWtC4obzARRnbZwnyx-qhfs6A>
    <xme:hui1Zbs_J7onqkko3z0-HKMhfG5vhgngjZJ2dX3A_n_Rct7ZowReWdO7nnu5pz_oV
    ZytEZjssJ7jFE2HNb8>
X-ME-Received: <xmr:hui1ZdB8vGd93PFvBuS0XicnNUsAMPh6wN750GlXTlh674_KYTn_rqadVPm5GSXjjKh4hM1vQa0yaEvhzWhda3BFgTbRAgKOz9Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedttddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeefieehjedvtefgiedtudethfekieelhfevhefgvddtkeekvdekhefftdek
    vedvueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:hui1ZbdwBzhax__TQMIFf4fycmgkJSzHWDXwEaaK8wUKVYjurlWmvQ>
    <xmx:hui1ZUMsZ2ENIFb9DkVlMZsf0CETLeD-IcGgIEg2pT8xMPtKfOvnVg>
    <xmx:hui1ZdmmXJPbAheteJw4h8jAPUrv4zMKsGELv-j0SOjh0gkW171Qeg>
    <xmx:h-i1Zblc6qpduetkIU1SmqcjjD_MuPpcQKVTPLmNiizhF33epcexFA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Jan 2024 00:39:16 -0500 (EST)
Date: Sun, 28 Jan 2024 16:39:18 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    Yury Norov <yury.norov@gmail.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Douglas Anderson <dianders@chromium.org>, 
    Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>, 
    Randy Dunlap <rdunlap@infradead.org>, 
    Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Marco Elver <elver@google.com>, Brian Cain <bcain@quicinc.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Matthew Wilcox <willy@infradead.org>, 
    "Paul E . McKenney" <paulmck@kernel.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v4 2/5] m68k/bitops: use __builtin_{clz,ctzl,ffs} to
 evaluate constant expressions
In-Reply-To: <20240128050449.1332798-3-mailhol.vincent@wanadoo.fr>
Message-ID: <c47fedaf-cdc9-f970-460f-d2ee7e806da4@linux-m68k.org>
References: <20221111081316.30373-1-mailhol.vincent@wanadoo.fr> <20240128050449.1332798-1-mailhol.vincent@wanadoo.fr> <20240128050449.1332798-3-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Sun, 28 Jan 2024, Vincent Mailhol wrote:

> The compiler is not able to do constant folding on "asm volatile" code.
> 
> Evaluate whether or not the function argument is a constant expression
> and if this is the case, return an equivalent builtin expression.
> 
> On linux 6.7 with an allyesconfig and GCC 13.2.1, it saves roughly 11 KB.
> 
>   $ size --format=GNU vmlinux.before vmlinux.after
>     text       data        bss      total filename
>     60457964   70953697    2288644  133700305 vmlinux.before
>     60441196   70957057    2290724  133688977 vmlinux.after
> 
> Reference: commit fdb6649ab7c1 ("x86/asm/bitops: Use __builtin_ctzl() to evaluate constant expressions")
> Link: https://git.kernel.org/torvalds/c/fdb6649ab7c1
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
>  arch/m68k/include/asm/bitops.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
> index a8b23f897f24..02ec8a193b96 100644
> --- a/arch/m68k/include/asm/bitops.h
> +++ b/arch/m68k/include/asm/bitops.h
> @@ -469,6 +469,9 @@ static __always_inline unsigned long ffz(unsigned long word)
>  {
>  	int res;
>  
> +	if (__builtin_constant_p(word))
> +		return __builtin_ctzl(~word);
> +
>  	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
>  			      : "=d" (res) : "d" (~word & -~word));
>  	return res ^ 31;

If the builtin has the desired behaviour, why do we reimplement it in asm? 
Shouldn't we abandon one or the other to avoid having to prove (and 
maintain) their equivalence?

> @@ -490,6 +493,9 @@ static __always_inline unsigned long ffz(unsigned long word)
>  	!defined(CONFIG_M68000)
>  static __always_inline unsigned long __ffs(unsigned long x)
>  {
> +	if (__builtin_constant_p(x))
> +		return __builtin_ctzl(x);
> +
>  	__asm__ __volatile__ ("bitrev %0; ff1 %0"
>  		: "=d" (x)
>  		: "0" (x));
> @@ -522,6 +528,9 @@ static __always_inline int ffs(int x)
>  {
>  	int cnt;
>  
> +	if (__builtin_constant_p(x))
> +		return __builtin_ffs(x);
> +
>  	__asm__ ("bfffo %1{#0:#0},%0"
>  		: "=d" (cnt)
>  		: "dm" (x & -x));
> @@ -540,6 +549,9 @@ static __always_inline int fls(unsigned int x)
>  {
>  	int cnt;
>  
> +	if (__builtin_constant_p(x))
> +		return x ? BITS_PER_TYPE(x) - __builtin_clz(x) : 0;
> +
>  	__asm__ ("bfffo %1{#0,#0},%0"
>  		: "=d" (cnt)
>  		: "dm" (x));
> 
