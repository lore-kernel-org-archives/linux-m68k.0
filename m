From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k: Add missing ioport_unmap()
Date: Mon, 15 Sep 2014 11:07:18 +1000
Message-ID: <54163BC6.1080407__6492.599056992$1410743846$gmane$org@uclinux.org>
References: <1410687925-10880-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1410687925-10880-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc: uclinux-dev@uclinux.org

Hi Geert,

On 14/09/14 19:45, Geert Uytterhoeven wrote:
> drivers/net/ethernet/cirrus/cs89x0.c: In function =E2=80=98cs89x0_iop=
ort_probe=E2=80=99:
> drivers/net/ethernet/cirrus/cs89x0.c:1629: error: implicit declaratio=
n of function =E2=80=98ioport_unmap=E2=80=99
>=20
> Add the missing ioport_unmap() implementation, and convert ioport_map=
()
> from a macro to a static inline function while we're at it (both copi=
ed
> from asm-generic).

The non-mmu version of this, io_no.h, doesn't implement these either.
Should it?

Regards
Greg


> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/include/asm/io_mm.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io=
_mm.h
> index ffdf54f44bc6..8955b40a5dc4 100644
> --- a/arch/m68k/include/asm/io_mm.h
> +++ b/arch/m68k/include/asm/io_mm.h
> @@ -510,6 +510,13 @@ static inline void memcpy_toio(volatile void __i=
omem *dst, const void *src, int
>   */
>  #define xlate_dev_kmem_ptr(p)	p
> =20
> -#define ioport_map(port, nr)	((void __iomem *)(port))
> +static inline void __iomem *ioport_map(unsigned long port, unsigned =
int nr)
> +{
> +	return (void __iomem *) port;
> +}
> +
> +static inline void ioport_unmap(void __iomem *p)
> +{
> +}
> =20
>  #endif /* _IO_H */
>=20
