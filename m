From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/3] m68k: merge the MMU and non-MMU
 versions of the entry.S code
Date: Sun, 20 May 2012 11:22:01 +0200
Message-ID: <CAMuHMdXYe5BgUEBPDsXji+Ez5m3FhF73bkVd_+Nfk8=-QAyrNw@mail.gmail.com>
References: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
 <1337314971-11087-4-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1337314971-11087-4-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

T24gRnJpLCBNYXkgMTgsIDIwMTIgYXQgNjoyMiBBTSwgIDxnZXJnQHNuYXBnZWFyLmNvbT4gd3Jv
dGU6Cj4gRnJvbTogR3JlZyBVbmdlcmVyIDxnZXJnQHVjbGludXgub3JnPgo+Cj4gU29tZSBvZiB0
aGUgZW50cnkuUyBjb2RlIGlzIGNvbW1vbiB0byBib3RoIE1NVSBhbmQgbm9uLU1NVSBidWlsZHMu
Cj4gU28gbWVyZ2UgdGhlIGVudHJ5X25vLlMgYW5kIGVudHJ5X21tLlMgZmlsZXMgYmFjayBpbnRv
IGEgc2luZ2xlIGZpbGUuCj4gV2l0aCBhIGxpdHRsZSBjb2RlIG1vdmVtZW50IHdlIG9ubHkgbmVl
ZCBhIHNpbmdsZSAjaWZkZWYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIFVuZ2VyZXIgPGdlcmdA
dWNsaW51eC5vcmc+CgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4KCkdye29ldGplLGVldGluZ31zLAoKwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoMKgIMKgwqAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KdUNsaW51eC1kZXYgbWFpbGluZyBsaXN0CnVD
bGludXgtZGV2QHVjbGludXgub3JnCmh0dHA6Ly9tYWlsbWFuLnVjbGludXgub3JnL21haWxtYW4v
bGlzdGluZm8vdWNsaW51eC1kZXYKVGhpcyBtZXNzYWdlIHdhcyByZXNlbnQgYnkgdWNsaW51eC1k
ZXZAdWNsaW51eC5vcmcKVG8gdW5zdWJzY3JpYmUgc2VlOgpodHRwOi8vbWFpbG1hbi51Y2xpbnV4
Lm9yZy9tYWlsbWFuL29wdGlvbnMvdWNsaW51eC1kZXY=
